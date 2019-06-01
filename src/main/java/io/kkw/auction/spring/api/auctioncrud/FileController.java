package io.kkw.auction.spring.api.auctioncrud;


import com.sun.media.jfxmediaimpl.MediaUtils;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.print.attribute.standard.Media;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

@RestController
@RequestMapping("/attachments")
public class FileController {

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<?> uploadAttachment(@RequestPart MultipartFile sourceFile) throws IOException {
        System.out.println(sourceFile.getSize());
        String sourceFileName = sourceFile.getOriginalFilename();
        String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase();
        System.out.println(sourceFileName);
        System.out.println(sourceFileNameExtension);
        File destinationFile;
        String destinationFileName;
        do {
            destinationFileName = new Date().getTime()+ "test" + "." + sourceFileNameExtension;
            destinationFile = new File("D:/attachments/" + destinationFileName);
        } while (destinationFile.exists());
        destinationFile.getParentFile().mkdirs();
        sourceFile.transferTo(destinationFile);

        UploadAttachmentResponse response = new UploadAttachmentResponse();
        response.setFileName(sourceFile.getOriginalFilename());
        response.setFileSize(sourceFile.getSize());
        response.setFileContentType(sourceFile.getContentType());
        response.setAttachmentUrl("http://localhost:8080/attachments/" + destinationFileName);

        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @ResponseBody
    @GetMapping(
            value = "/load",
            produces =  MediaType.IMAGE_JPEG_VALUE
    )
    public ResponseEntity<byte[]> loadImage() throws Exception{
        InputStream in = null;
        ResponseEntity<byte[]> entity = null;
        //String mType = MediaUtils.filenameToContentType("1559396100547test.jpg");
        //System.out.println(mType);
        try{
            in = new FileInputStream("D:/attachments/1559396100547test.jpg");
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
        }catch(Exception e){
            e.printStackTrace();
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        }finally{
            in.close();
        }

        return entity;
    }

    @NoArgsConstructor
    @Data
    private static class UploadAttachmentResponse {

        private String fileName;

        private long fileSize;

        private String fileContentType;

        private String attachmentUrl;
    }
}
