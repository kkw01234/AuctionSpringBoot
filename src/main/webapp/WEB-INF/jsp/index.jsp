<%@ page import="io.kkw.auction.spring.bean.AucUserBean" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String id = (String) request.getAttribute("userid");
    String password = (String) request.getAttribute("password");
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Elsa, a multipurpose Template from Andreas Lautenschlager">
    <meta name="author" content="Andreas Lautenschlager - www.lautenschlager.de">

    <title>Elsa Theme - Multipurpose Template from Andreas Lautenschlager</title>

    <!-- normalize core CSS -->
    <link href="css/normalize.css" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/carousel.css" rel="stylesheet">
    <link href="bootstrap/fonts/glyphicons-halflings-regular.eot" rel="stylesheet">

    <!-- Load jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="bootstrap/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <script src="bootstrap/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Fonts - Change if needed -->
    <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400italic,400,700,300,600' rel='stylesheet'
          type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oxygen:400,700,300' rel='stylesheet' type='text/css'>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <!-- Menu shrinking -->
    <script type="text/javascript" src="js/menu.js"></script>

    <!-- Main styles of this template -->
    <link href="css/style.min.css?v=1.0.0" rel="stylesheet">

    <!-- Custom CSS. Input here your changes -->
    <link href="css/custom.css" rel="stylesheet">

</head>

<body>


<!-- Navigation -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="index.html"><img class="logo" src="img/logo.png" alt="Logo"></a>
        </div>
        <nav class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown active">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Home<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-header">Main Page</li>
                        <li class="active"><a href="index.html">Index</a></li>
                        <li class="dropdown-header">Alternative Headers</li>
                        <li><a href="index-header-hero.html">Hero Image</a></li>
                        <li><a href="index-header-product.html">Product Feature</a></li>
                        <li><a href="index-header-newsletter.html">Newsletter</a></li>
                        <li><a href="index-header-carousel.html">Classic Carousel</a></li>
                        <li><a href="index-header-video.html">Video</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-header">Company</li>
                        <li><a href="about-us.html">About Us</a></li>
                        <li><a href="our-team.html">Our Team</a></li>
                        <li><a href="sales-page.html">Sales Page</a></li>
                        <li><a href="contact.html">Contact Us</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-header">Creative</li>
                        <li><a href="about-me.html">About Me</a></li>
                        <li><a href="portfolio.html">Portfolio</a></li>
                        <li><a href="portfolio-item.html">Portfolio Item</a></li>
                        <li><a href="gallery.html">Gallery</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Page Layouts<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-header">Page Layouts</li>
                        <li><a href="full-width.html">Full Width</a></li>
                        <li><a href="right-sidebar.html">Right Sidebar</a></li>
                        <li><a href="left-sidebar.html">Left Sidebar</a></li>
                        <li><a href="right-left-sidebar.html">Right &amp; Left Sidebar</a></li>
                        <li><a href="404.html">404 Error</a></li>
                    </ul>
                </li>
                <li><a href="components.html">Components</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-header">Standard Layout</li>
                        <li><a href="blog-right-sidebar.html">Blog Right Sidebar</a></li>
                        <li><a href="blog-single-post.html">Blog Single Post</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-header">Creative Layout</li>
                        <li><a href="blog-full-width.html">Blog No Sidebar</a></li>
                        <li><a href="blog-left-sidebar.html">Blog Left Sidebar</a></li>
                    </ul>
                </li>
                <li><a href="contact.html">Contact</a></li>
            </ul>
        </nav>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</div>


<!-- Hero Header -->
<header class="hero-header" style="background-image: url('http://placehold.it/1900x1250');">
    <div class="container">
        <div class="intro-text">
            <div class="intro-lead-in">Welcome To Elsa!</div>
            <div class="intro-heading">A beautiful and clean HTML template</div>
            <a href="#intro" class="btn btn-primary btn-lg">See More</a>
        </div>
    </div>
</header>


<!-- Call to Action -->
<div class="sec-alternative" style="background-image: url(img/odd_background.png)">
    <div class="container cta">
        <div class="row">
            <div class="col-md-8">
                <p>
                    This could be your <span>Website</span>
                    <br/>
                    <span>Check out all layouts and features</span>
                </p>
            </div>
            <div class="col-md-4">
                <div class="cta-button">
                    <a href="#demos" class="btn btn-primary">Buy Theme for 10$</a> <span><a
                        href="#">or see more</a></span>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Intro -->
<section class="page-section" id="intro">
    <div class="container intro">
        <div class="row margin-bottom-50">
            <div class="col-md-12 text-center">
                <h1 class="title-section"><span
                        class="title-regular">Elsa is a <strong>multipurpose</strong></span><br/>HTML Template on
                    ThemeForest.</h1>
                <hr class="title-underline-center">
                <p class="lead">Lorem ipsum dolor sit amet, consetetur sadipscing elitr,
                    <br/>sed diam nonumy eirmod tempor invidunt ut labore et dolore magna</p>
            </div>
        </div>
        <div class="row text-center">
            <div>
                <div class="col-md-3 col-sm-6">
                    <div>
                        <i class="fa fa-desktop"></i>
                        <label><strong>14</strong>
                            <br/>Complete Projects</label>
                        <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor
                            invidunt ut labore</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div>
                        <i class="fa fa-user"></i>
                        <label><strong>2543</strong>
                            <br/>Happy Clients</label>
                        <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor
                            invidunt ut labore</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div>
                        <i class="fa fa-code"></i>
                        <label><strong>14489</strong>
                            <br/>Line Of Coding</label>
                        <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor
                            invidunt ut labore</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div>
                        <i class="fa fa-trophy"></i>
                        <label><strong>21</strong>
                            <br/>Awards</label>
                        <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor
                            invidunt ut labore</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- Call to Action Primary -->
<section class="cta cta-primary">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2>Get this Theme <span>now</span></h2>
                <p>Lorem ipsum dolor sit amet, consetetur sadipscing <strong>elitr, sed diam nonumy</strong> eirmod
                    tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>
            </div>
            <div class="col-md-2 col-md-push-4 cta-button">
                <a href="#demos" class="btn btn-primary" style="padding: 35px 15px;">Buy Theme for 10$</a>
            </div>
        </div>
    </div>
</section>


<!-- About -->
<section class="page-section">
    <div class="container ">
        <div class="row">
            <div class="col-md-8 col-md-push-4">
                <div class="col-md-12">
                    <h2 class="title-section"><span class="title-regular">WE ARE</span><br/>LAUTENSCHLAGER</h2>
                    <hr class="title-underline"/>
                </div>
                <div class="row">
                    <div class="col-md-6 ">
                        <div class="col-xs-2 box-icon">
                            <div class="fa fa-html5 "></div>
                        </div>
                        <div class="col-xs-10">
                            <h3>HTML5 TEMPLATES</h3>
                        </div>
                        <div class="col-md-10 col-xs-offset-2">
                            <p>
                                Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur
                                quam volutpat suscipit antena.
                            </p>
                        </div>
                    </div>
                    <div class="col-md-6 ">

                        <div class="col-xs-2 box-icon">
                            <div class="fa fa-wordpress "></div>
                        </div>
                        <div class="col-xs-10">
                            <h3>WORDPRESS TEMPLATES</h3>
                        </div>
                        <div class="col-md-10 col-xs-offset-2">
                            <p>
                                Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur
                                quam volutpat suscipit antena.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 ">

                        <div class="col-xs-2 box-icon">
                            <div class="fa fa-camera "></div>
                        </div>
                        <div class="col-xs-10">
                            <h3>STOCK PHOTOS</h3>
                        </div>
                        <div class="col-md-10 col-xs-offset-2">
                            <p>
                                Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur
                                quam volutpat suscipit antena.
                            </p>
                        </div>
                    </div>
                    <div class="col-md-6 ">

                        <div class="col-xs-2 box-icon">
                            <div class="fa fa-joomla "></div>
                        </div>
                        <div class="col-xs-10">
                            <h3>JOOMLA TEMPLATES</h3>
                        </div>
                        <div class="col-md-10 col-xs-offset-2">
                            <p>
                                Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur
                                quam volutpat suscipit antena.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-md-pull-8 ">
                <img class="img-responsive" src="http://placehold.it/365x376" alt=""/>
            </div>
        </div>
    </div>
</section>


<!-- Features -->
<section class="page-section section-grey">
    <div class="container ">
        <div class="row">
            <div class="col-md-12">
                <h2 class="title-section"><span class="title-regular">SPECIAL</span><br/>FEATURES</h2>
                <hr class="title-underline "/>
                <div class="row">
                    <div class="col-sm-3">
                        <div class="feature-box">
                            <div class="feature-box-icon">
                                <i class="fa fa-code"></i>
                            </div>
                            <div class="feature-box-info">
                                <h4>Clean Code</h4>
                                <p>Lorem ipsum dolor sit amet</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="feature-box">
                            <div class="feature-box-icon">
                                <i class="fa fa-expand"></i>
                            </div>
                            <div class="feature-box-info">
                                <h4>Bootstrap 3</h4>
                                <p>Lorem ipsum dolor sit amet</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="feature-box">
                            <div class="feature-box-icon">
                                <i class="fa fa-font"></i>
                            </div>
                            <div class="feature-box-info">
                                <h4>Font Awesome</h4>
                                <p>Lorem ipsum dolor sit amet</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="feature-box">
                            <div class="feature-box-icon">
                                <i class="fa fa-eye"></i>
                            </div>
                            <div class="feature-box-info">
                                <h4>Color Options</h4>
                                <p>Lorem ipsum dolor sit amet</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="feature-box">
                            <div class="feature-box-icon">
                                <i class="fa fa-picture-o"></i>
                            </div>
                            <div class="feature-box-info">
                                <h4>Clean Headers</h4>
                                <p>Lorem ipsum dolor sit amet</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="feature-box">
                            <div class="feature-box-icon">
                                <i class="fa fa-archive"></i>
                            </div>
                            <div class="feature-box-info">
                                <h4>Portfolio</h4>
                                <p>Lorem ipsum dolor sit amet</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="feature-box">
                            <div class="feature-box-icon">
                                <i class="fa fa-expand"></i>
                            </div>
                            <div class="feature-box-info">
                                <h4>Lightbox</h4>
                                <p>Lorem ipsum dolor sit amet</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="feature-box">
                            <div class="feature-box-icon">
                                <i class="fa fa-picture-o"></i>
                            </div>
                            <div class="feature-box-info">
                                <h4>Gallery</h4>
                                <p>Lorem ipsum dolor sit amet</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- Full Spotlight left-->
<section class="page-section-no-padding">
    <div class="container-fluid">
        <div class="row">
            <div class="container col-md-6">
                <div class="row">
                    <div class="col-md-7 col-md-offset-4 spotlight-container">
                        <h2 class="title-section"><span class="title-regular">FULL LEFT</span><br/>SPOTLIGHT</h2>
                        <hr class="title-underline"/>
                        <p>
                            Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor
                            invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam
                            et justo duo dolores et ea rebum.
                        </p>
                        <a href="#" class="btn btn-primary">More Information</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 spotlight-img-cont" style="background-image: url(http://placehold.it/651x431); "></div>
        </div>
    </div>
</section>


<!-- Full Spotlight right-->
<section class="page-section-no-padding">
    <div class="container-fluid">
        <div class="row">
            <div class="container col-md-6 col-md-push-6">
                <div class="row">
                    <div class="col-md-7 col-md-offset-1 spotlight-container">
                        <h2 class="title-section"><span class="title-regular">FULL RIGHT</span><br/>SPOTLIGHT</h2>
                        <hr class="title-underline"/>
                        <p>
                            Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor
                            invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam
                            et justo duo dolores et ea rebum.
                        </p>
                        <a href="#" class="btn btn-primary">More Information</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-md-pull-6 spotlight-img-cont"
                 style="background-image: url(http://placehold.it/647x431); "></div>
        </div>
    </div>
</section>


<!-- Our Services -->
<section class="page-section ">
    <div class="container ">
        <div class="row">
            <div class="col-md-4">
                <h2 class="title-section"><span class="title-regular">OUR</span><br/>SERVICES</h2>
                <hr class="title-underline"/>
            </div>
            <div class="col-md-4 ">
                <div class="col-xs-2 box-icon">
                    <div class="fa fa-desktop"></div>
                </div>
                <div class="col-xs-10">
                    <h4>WEBDESGIN</h4>
                    <h5>Lorem Ipsum Dolor</h5>
                </div>
                <div class="col-md-12">
                    <p>
                        Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur quam
                        volutpat suscipit antena.
                    </p>
                </div>
            </div>
            <div class="col-md-4 ">
                <div class="col-xs-2 box-icon">
                    <div class="fa fa-clipboard"></div>
                </div>
                <div class="col-xs-10">
                    <h4>TEMPLATES</h4>
                    <h5>Lorem Ipsum Dolor</h5>
                </div>
                <div class="col-md-12">
                    <p>
                        Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur quam
                        volutpat suscipit antena.
                    </p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 ">
                <div class="col-xs-2 box-icon">
                    <div class="fa fa-camera"></div>
                </div>
                <div class="col-xs-10">
                    <h4>PHOTOGRAPHY</h4>
                    <h5>Lorem Ipsum Dolor</h5>
                </div>
                <div class="col-md-12">
                    <p>
                        Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur quam
                        volutpat suscipit antena.
                    </p>
                </div>
            </div>
            <div class="col-md-4 ">
                <div class="col-xs-2 box-icon">
                    <div class="fa fa-pencil"></div>
                </div>
                <div class="col-xs-10">
                    <h4>GRAPHICS</h4>
                    <h5>Lorem Ipsum Dolor</h5>
                </div>
                <div class="col-xs-12">
                    <p>
                        Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur quam
                        volutpat suscipit antena.
                    </p>
                </div>
            </div>
            <div class="col-md-4 ">
                <div class="col-xs-2 box-icon">
                    <div class="fa fa-bullseye"></div>
                </div>
                <div class="col-xs-10">
                    <h4>BRANDING</h4>
                    <h5>Lorem Ipsum Dolor</h5>
                </div>
                <div class="col-md-12">
                    <p>
                        Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur quam
                        volutpat suscipit antena.
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- Portfolio / Projects -->
<section class="page-section-no-padding">
    <!-- /3 Column Portfolio -->
    <div class="filter-section">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-xs-12">
                    <h1>3 Column Portfolio</h1>
                    <div class="filter-container isotopeFilters">
                        <ul class="list-inline filter">
                            <li class="active"><a href="#" data-filter="*">All </a><span>/</span></li>
                            <li><a href="#" data-filter=".illustrations">Illustrations</a><span>/</span></li>
                            <li><a href="#" data-filter=".photography">Photography</a><span>/</span></li>
                            <li><a href="#" data-filter=".websites">Websites</a><span>/</span></li>
                            <li><a href="#" data-filter=".art">Art</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="portfolio-section port-col">

        <div class="row">
            <div class="isotopeContainer">

                <div class="col-md-4 isotopeSelector photography">
                    <article class="">
                        <figure>
                            <img src="http://placehold.it/625x450" alt="">
                            <div class="overlay-background">
                                <div class="inner"></div>
                            </div>
                            <div class="overlay">
                                <div class="inner-overlay">
                                    <div class="row margin-0 project-content">
                                        <div class="col-md-12 info-head">
                                            <h3>Project Title</h3>
                                            <h4>Category</h4>
                                        </div>
                                        <div class="col-md-12 info">
                                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
                                                eirmod tempor invidunt ut labore et dolore...</p>
                                            <p><a title="Project Image" class="fancybox-pop fancybox.image"
                                                  href="http://placehold.it/625x450"><i
                                                    class="fa fa-search fa-border fa-2x"></i></a>
                                                <a title="Project Link" href="portfolio-item.html"><i
                                                        class="fa fa-link fa-border fa-2x"></i></a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </figure>
                    </article>
                </div>

                <div class="col-md-4 isotopeSelector photography illustrations">
                    <article class="">
                        <figure>
                            <img src="http://placehold.it/625x450" alt="">
                            <div class="overlay-background">
                                <div class="inner"></div>
                            </div>
                            <div class="overlay">
                                <div class="inner-overlay">
                                    <div class="row margin-0 project-content">
                                        <div class="col-md-12 info-head">
                                            <h3>Project Title</h3>
                                            <h4>Category</h4>
                                        </div>
                                        <div class="col-md-12 info">
                                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
                                                eirmod tempor invidunt ut labore et dolore...</p>
                                            <p><a title="Project Image" class="fancybox-pop fancybox.image"
                                                  href="http://placehold.it/625x450"><i
                                                    class="fa fa-search fa-border fa-2x"></i></a>
                                                <a title="Project Link" href="portfolio-item.html"><i
                                                        class="fa fa-link fa-border fa-2x"></i></a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </figure>
                    </article>
                </div>

                <div class="col-md-4 isotopeSelector art">
                    <article class="">
                        <figure>
                            <img src="http://placehold.it/625x450" alt="">
                            <div class="overlay-background">
                                <div class="inner"></div>
                            </div>
                            <div class="overlay">
                                <div class="inner-overlay">
                                    <div class="row margin-0 project-content">
                                        <div class="col-md-12 info-head">
                                            <h3>Project Title</h3>
                                            <h4>Category</h4>
                                        </div>
                                        <div class="col-md-12 info">
                                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
                                                eirmod tempor invidunt ut labore et dolore...</p>
                                            <p><a title="Project Image" class="fancybox-pop fancybox.image"
                                                  href="http://placehold.it/625x450"><i
                                                    class="fa fa-search fa-border fa-2x"></i></a>
                                                <a title="Project Link" href="portfolio-item.html"><i
                                                        class="fa fa-link fa-border fa-2x"></i></a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </figure>
                    </article>
                </div>

                <div class="col-md-4 isotopeSelector photography">
                    <article class="">
                        <figure>
                            <img src="http://placehold.it/625x450" alt="">
                            <div class="overlay-background">
                                <div class="inner"></div>
                            </div>
                            <div class="overlay">
                                <div class="inner-overlay">
                                    <div class="row margin-0 project-content">
                                        <div class="col-md-12 info-head">
                                            <h3>Project Title</h3>
                                            <h4>Category</h4>
                                        </div>
                                        <div class="col-md-12 info">
                                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
                                                eirmod tempor invidunt ut labore et dolore...</p>
                                            <p><a title="Project Image" class="fancybox-pop fancybox.image"
                                                  href="http://placehold.it/625x450"><i
                                                    class="fa fa-search fa-border fa-2x"></i></a>
                                                <a title="Project Link" href="portfolio-item.html"><i
                                                        class="fa fa-link fa-border fa-2x"></i></a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </figure>
                    </article>
                </div>

                <div class="col-md-4 isotopeSelector photography websites">
                    <article class="">
                        <figure>
                            <img src="http://placehold.it/625x450" alt="">
                            <div class="overlay-background">
                                <div class="inner"></div>
                            </div>
                            <div class="overlay">
                                <div class="inner-overlay">
                                    <div class="row margin-0 project-content">
                                        <div class="col-md-12 info-head">
                                            <h3>Project Title</h3>
                                            <h4>Category</h4>
                                        </div>
                                        <div class="col-md-12 info">
                                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
                                                eirmod tempor invidunt ut labore et dolore...</p>
                                            <p><a title="Project Image" class="fancybox-pop fancybox.image"
                                                  href="http://placehold.it/625x450"><i
                                                    class="fa fa-search fa-border fa-2x"></i></a>
                                                <a title="Project Link" href="portfolio-item.html"><i
                                                        class="fa fa-link fa-border fa-2x"></i></a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </figure>
                    </article>
                </div>

                <div class="col-md-4 isotopeSelector photography art">
                    <article class="">
                        <figure>
                            <img src="http://placehold.it/625x450" alt="">
                            <div class="overlay-background">
                                <div class="inner"></div>
                            </div>
                            <div class="overlay">
                                <div class="inner-overlay">
                                    <div class="row margin-0 project-content">
                                        <div class="col-md-12 info-head">
                                            <h3>Project Title</h3>
                                            <h4>Category</h4>
                                        </div>
                                        <div class="col-md-12 info">
                                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
                                                eirmod tempor invidunt ut labore et dolore...</p>
                                            <p><a title="Project Image" class="fancybox-pop fancybox.image"
                                                  href="http://placehold.it/625x450"><i
                                                    class="fa fa-search fa-border fa-2x"></i></a>
                                                <a title="Project Link" href="portfolio-item.html"><i
                                                        class="fa fa-link fa-border fa-2x"></i></a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </figure>
                    </article>
                </div>


            </div>

        </div>
    </div>
    <!-- END Columns Portfolio -->

    <div class="text-center">
        <button type="button" class="btn btn-primary ">VIEW MORE PROJECTS <i class="fa fa-arrow-right"></i></button>
    </div>

</section>


<!-- Our Clients -->
<section class="page-section">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-push-8">
                <h2 class="title-section"><span class="title-regular">OUR</span><br/>CLIENTS</h2>
                <hr class="title-underline"/>
                <p>
                    Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur quam
                    volutpat suscipit antena.
                </p>
            </div>
            <div class="col-md-8 col-md-pull-4 text-center">
                <div class="row">
                    <div class="col-md-4">
                        <img src="http://placehold.it/168x168" alt="" class="client-logo"/>
                    </div>
                    <div class="col-md-4">
                        <img src="http://placehold.it/168x168" alt="" class="client-logo"/>
                    </div>
                    <div class="col-md-4">
                        <img src="http://placehold.it/168x168" alt="" class="client-logo"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <img src="http://placehold.it/168x168" alt="" class="client-logo"/>
                    </div>
                    <div class="col-md-4">
                        <img src="http://placehold.it/168x168" alt="" class="client-logo"/>
                    </div>
                    <div class="col-md-4">
                        <img src="http://placehold.it/168x168" alt="" class="client-logo"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- ALTERNATIVE SECTION -->
<!-- insert "sec-alternative" class into section tag -->

<section class="page-section sec-alternative" style="background-image: url(img/odd_background.png)">
    <div class="container">

        <div class="row">
            <div class="col-md-4">
                <h2 class="title-section"><span class="title-regular">OUR</span><br/>SERVICES</h2>
                <hr class="title-underline"/>
            </div>
            <div class="col-md-4 ">
                <div class="col-xs-2 box-icon">
                    <div class="fa fa-desktop"></div>
                </div>
                <div class="col-xs-10">
                    <h4>WEBDESGIN</h4>
                    <h5>Lorem Ipsum Dolor</h5>
                </div>
                <div class="col-md-12">
                    <p>
                        Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur quam
                        volutpat suscipit antena.
                    </p>
                </div>
            </div>
            <div class="col-md-4 ">
                <div class="col-xs-2 box-icon">
                    <div class="fa fa-clipboard"></div>
                </div>
                <div class="col-xs-10">
                    <h4>TEMPLATES</h4>
                    <h5>Lorem Ipsum Dolor</h5>
                </div>
                <div class="col-md-12">
                    <p>
                        Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur quam
                        volutpat suscipit antena.
                    </p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="col-xs-2 box-icon">
                    <div class="fa fa-camera"></div>
                </div>
                <div class="col-xs-10">
                    <h4>PHOTOGRAPHY</h4>
                    <h5>Lorem Ipsum Dolor</h5>
                </div>
                <div class="col-md-12">
                    <p>
                        Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur quam
                        volutpat suscipit antena.
                    </p>
                </div>
            </div>
            <div class="col-md-4 ">
                <div class="col-xs-2 box-icon">
                    <div class="fa fa-pencil"></div>
                </div>
                <div class="col-xs-10">
                    <h4>GRAPHICS</h4>
                    <h5>Lorem Ipsum Dolor</h5>
                </div>
                <div class="col-xs-12">
                    <p>
                        Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur quam
                        volutpat suscipit antena.
                    </p>
                </div>
            </div>
            <div class="col-md-4 ">
                <div class="col-xs-2 box-icon">
                    <div class="fa fa-bullseye"></div>
                </div>
                <div class="col-xs-10">
                    <h4>BRANDING</h4>
                    <h5>Lorem Ipsum Dolor</h5>
                </div>
                <div class="col-md-12">
                    <p>
                        Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur quam
                        volutpat suscipit antena.
                    </p>
                </div>
            </div>
        </div>

    </div>
</section>


<!-- Our Team-->
<section class="page-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="title-section"><span class="title-regular">OUR</span><br/>TEAM</h2>
                <hr class="title-underline"/>
            </div>
            <div class="col-md-12">
                <img class="img-responsive" src="http://placehold.it/1148x550" alt=""/>
            </div>
        </div>
        <div class="text-center margin-top-30">
            <button type="button" class="btn btn-primary">MORE ABOUT US <i class="fa fa-arrow-right"></i></button>
        </div>
    </div>
</section>


<!-- Left Spotlight-->
<section class="page-section section-grey">
    <div class="container">
        <div class="row">
            <div class="col-md-5  spotlight-container">
                <h2 class="title-section"><span class="title-regular">LEFT</span><br/>SPOTLIGHT</h2>
                <hr class="title-underline"/>
                <p>
                    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
                    labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
                    et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
                    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
                    labore et dolore magna aliquyam erat, sed diam voluptua.
                </p>
            </div>
            <div class="col-md-6 col-md-push-1 padding-0">
                <img class=" img-responsive" src="http://placehold.it/560x431" alt=""/>
            </div>
        </div>
    </div>
</section>


<!-- RIGHT SPOTLIGHT-->
<section class="page-section">
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-md-push-7 spotlight-container">
                <h2 class="title-section"><span class="title-regular">RIGHT</span><br/>SPOTLIGHT</h2>
                <hr class="title-underline"/>
                <p>
                    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
                    labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
                    et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
                    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
                    labore et dolore magna aliquyam erat, sed diam voluptua.
                </p>
            </div>
            <div class="col-md-6  col-md-pull-5 padding-0">
                <img class=" img-responsive" src="http://placehold.it/560x431" alt=""/>
            </div>
        </div>
    </div>
</section>


<!-- VIDEO -->
<div class="page-section-no-padding  video-container"
     style="background-image: url(http://placehold.it/1920x1080); background-size: cover;">
    <div class="video-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 ">
                    SEE HOW
                    <a class="fancybox-media vide-icon" href="http://www.youtube.com/watch?v=opj24KnzrWo"><i
                            class=" fa fa-play-circle-o"></i></a> WE WORK
                </div>
            </div>
        </div>
    </div>
</div>


<!-- BLOG/LATEST NEWS-->
<section class="page-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="title-section"><span class="title-regular">LATEST</span><br/>NEWS</h2>
                <hr class="title-underline"/>
            </div>
        </div>
        <div class="row blog-listing">
            <div class="col-md-4">
                <article>
                    <img class="img-thumbnail" src="http://placehold.it/690x527" alt=""/>
                    <h2>Article 1</h2>
                    <hr class="title-underline">
                    <p>
                        Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt
                        ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo
                        dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor
                        sit amet...
                    </p>
                    <div class="post-meta">
                        <span><i class="fa fa-calendar"></i> Aug 17, 2016 - 6:53</span>
                        <span><i class="fa fa-user"></i> By <a href="#">John Doe</a> </span>
                        <span><i class="fa fa-tag"></i> <a href="#">Duis</a>, <a href="#">News</a> </span>
                        <span><i class="fa fa-comments"></i> <a href="#">12 Comments</a></span>
                    </div>
                    <a href="blog-single-post.html" class="btn btn-xs btn-primary">Read more...</a>
                </article>
            </div>
            <div class="col-md-4">
                <article>
                    <img class="img-thumbnail" src="http://placehold.it/690x527" alt=""/>
                    <h2>Article 2</h2>
                    <hr class="title-underline">
                    <p>
                        Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt
                        ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo
                        dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor
                        sit amet...
                    </p>
                    <div class="post-meta">
                        <span><i class="fa fa-calendar"></i> Aug 17, 2016 - 6:53</span>
                        <span><i class="fa fa-user"></i> By <a href="#">John Doe</a> </span>
                        <span><i class="fa fa-tag"></i> <a href="#">Duis</a>, <a href="#">News</a> </span>
                        <span><i class="fa fa-comments"></i> <a href="#">12 Comments</a></span>
                    </div>
                    <a href="blog-single-post.html" class="btn btn-xs btn-primary">Read more...</a>
                </article>
            </div>
            <div class="col-md-4">
                <article>
                    <img class="img-thumbnail" src="http://placehold.it/690x527" alt=""/>
                    <h2>Article 3</h2>
                    <hr class="title-underline">
                    <p>
                        Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt
                        ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo
                        dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor
                        sit amet...
                    </p>
                    <div class="post-meta">
                        <span><i class="fa fa-calendar"></i> Aug 17, 2016 - 6:53</span>
                        <span><i class="fa fa-user"></i> By <a href="#">John Doe</a> </span>
                        <span><i class="fa fa-tag"></i> <a href="#">Duis</a>, <a href="#">News</a> </span>
                        <span><i class="fa fa-comments"></i> <a href="#">12 Comments</a></span>
                    </div>
                    <a href="blog-single-post.html" class="btn btn-xs btn-primary">Read more...</a>
                </article>
            </div>
        </div>
    </div>
</section>


<!-- Highlighted Testmonial -->
<div class="page-section-no-padding testmonial-container"
     style="background-image: url(http://placehold.it/1920x1080); background-size: cover;">
    <div class="testmonial-content ">
        <div class="container">
            <div class="text-center">
                <p class="margin-0"> "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
                    tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam
                    et Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt
                    ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et"
                    <br/> - John Doe -
                    <br/>CEO
                </p>
            </div>
        </div>
    </div>
</div>


<!-- Our Skills -->
<section class="page-section">
    <div class="container">
        <div class="row ">
            <div class="col-md-12 text-center">
                <h2 class="title-section"><span class="title-regular">OUR</span><br/>SKILLS</h2>
                <hr class="title-underline col-centered"/>
            </div>
            <div class="col-md-4 col-md-offset-4 text-center">
                <p> Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur quam
                    volutpat suscipit antena.</p>
            </div>
            <div class="col-md-6">
                <p class="margin-0">HTML5</p>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="75"
                         aria-valuemin="0" aria-valuemax="100" style="width:75%">
                        75%
                    </div>
                </div>
                <p class="margin-0">CSS3</p>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="82"
                         aria-valuemin="0" aria-valuemax="100" style="width:82%">
                        82%
                    </div>
                </div>
                <p class="margin-0">PHP</p>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="65"
                         aria-valuemin="0" aria-valuemax="100" style="width:65%">
                        65%
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <p class="margin-0">jQuery</p>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="50"
                         aria-valuemin="0" aria-valuemax="100" style="width:50%">
                        50%
                    </div>
                </div>
                <p class="margin-0">JavaScript</p>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="32"
                         aria-valuemin="0" aria-valuemax="100" style="width:32%">
                        32%
                    </div>
                </div>
                <p class="margin-0">MySQL</p>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="47"
                         aria-valuemin="0" aria-valuemax="100" style="width:47%">
                        47%
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- Our Team Creative -->
<section class="page-section-no-padding ">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 text-center">
                <h2 class="title-section"><span class="title-regular">OUR</span><br/>TEAM</h2>
                <hr class="title-underline col-centered"/>
            </div>
        </div>
        <div class="row ">
            <div class="col-md-3 padding-0">
                <div class="hovereffect">
                    <img class=" img-responsive" src="http://placehold.it/480x550" alt=""/>
                    <div class="overlay text-center team-content">
                        <h3 class="info">JOE DOE</h3>
                        <p class="info">CEO FOUNDER</p>
                        <p class="info">Lorem ipsum dolor sit amet, consectetur adivpiscing elit. Proin consequat
                            sollicitudin cursus.</p>
                        <a href="#" class="info" title="Facebook" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="#" class="info" title="Google-plus" target="_blank"><i
                                class="fa fa-google-plus"></i></a>
                        <a href="#" class="info" title="Twitter" target="_blank"><i class="fa fa-twitter"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 padding-0">
                <div class="hovereffect">
                    <img class=" img-responsive" src="http://placehold.it/480x550" alt=""/>
                    <div class="overlay text-center team-content">
                        <h3 class="info">JANE DOE</h3>
                        <p class="info">CO FOUNDER</p>
                        <p class="info">Lorem ipsum dolor sit amet, consectetur adivpiscing elit. Proin consequat
                            sollicitudin cursus.</p>
                        <a href="#" class="info" title="Facebook" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="#" class="info" title="Google-plus" target="_blank"><i
                                class="fa fa-google-plus"></i></a>
                        <a href="#" class="info" title="Twitter" target="_blank"><i class="fa fa-twitter"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 padding-0">
                <div class="hovereffect">
                    <img class=" img-responsive" src="http://placehold.it/480x550" alt=""/>
                    <div class="overlay text-center team-content">
                        <h3 class="info">JAMES DOE</h3>
                        <p class="info">DEVELOPER</p>
                        <p class="info">Lorem ipsum dolor sit amet, consectetur adivpiscing elit. Proin consequat
                            sollicitudin cursus.</p>
                        <a href="#" class="info" title="Facebook" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="#" class="info" title="Google-plus" target="_blank"><i
                                class="fa fa-google-plus"></i></a>
                        <a href="#" class="info" title="Twitter" target="_blank"><i class="fa fa-twitter"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 padding-0">
                <div class="hovereffect">
                    <img class=" img-responsive" src="http://placehold.it/480x550" alt=""/>
                    <div class="overlay text-center team-content">
                        <h3 class="info">JENNY DOE</h3>
                        <p class="info">MARKETING</p>
                        <p class="info">Lorem ipsum dolor sit amet, consectetur adivpiscing elit. Proin consequat
                            sollicitudin cursus.</p>
                        <a href="#" class="info" title="Facebook" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="#" class="info" title="Google-plus" target="_blank"><i
                                class="fa fa-google-plus"></i></a>
                        <a href="#" class="info" title="Twitter" target="_blank"><i class="fa fa-twitter"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- Contact Us -->
<section class="page-section-no-padding">
    <div class="container-fluid">
        <div class="row ">
            <div class="col-md-6 col-md-push-6">
                <div class="container">
                    <div class="row ">
                        <div class="col-md-6 contact-container">
                            <h2 class="title-section"><span class="title-regular">CONTACT</span><br/>US</h2>
                            <hr class="title-underline"/>
                            <p>
                                Maecenas luctus nisi in sem fermentum blat. In nec elit solliudin, elementum, dictum pur
                                quam volutpat suscipit antena.
                            </p>
                            <div class="form-group">
                                <input type="text" class="form-control" id="usr" placeholder="NAME">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="email" placeholder="EMAIL">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" rows="5" id="message" placeholder="MESSAGE"></textarea>
                            </div>
                            <button type="button" class="btn btn-default">SEND <i class="fa fa-envelope"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-md-pull-6 padding-0 ">
                <div id="map" class="img-responsive map-style"></div>
            </div>
        </div>
    </div>
</section>


<!-- FOOTER 1 -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-3 ">
                <div>
                    <a href="index.html">
                        <img class="footer-logo" src="img/logo-footer.png" alt="logo">
                    </a>
                </div>
                <div>
                    <address class="margin-bottom-30">
                        <p>Samplestreet 3<br/>
                            34117 Kassel<br/>
                            Germany</p>
                    </address>
                </div>
                <div class="margin-bottom-30">
                    <p><i class="fa fa-phone"></i> +49 561 00 00 00 00
                        <br/>
                        <i class="fa fa-fax"></i> +49 561 00 00 00 00</p>
                </div>
                <div>
                    <a href="https://lautenschlager.de">www.lautenschlager.de</a>
                    <br/>
                    <a href="mailto:info@lautenschlager.de">info@lautenschlager.de</a>
                </div>
            </div>
            <div class="col-md-3 footer-menu">
                <h4>About Us</h4>
                <p>Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim
                    placerat facer possim assum.</p>
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
                    laoreet dolore magna aliquam erat volutpat. </p>
                <a href="about-us.html">
                    <button class="btn btn-primary">Read More</button>
                </a>
            </div>
            <div class="col-md-3 footer-blog">
                <h4>RECENT BLOG POSTS</h4>
                <ul>
                    <li><a href="#">Blog Entry 1<br/></a> <a href="#">February 10 / John Doe </a></li>
                    <li><a href="#">Blog Entry 2<br/></a> <a href="#">March 14 / Jane Doe </a></li>
                    <li><a href="#">Blog Entry 3<br/></a> <a href="#">April 06 / Jenny Doe </a></li>
                    <li><a href="#">Blog Entry 4<br/></a> <a href="#">June 25 / James Doe </a></li>
                </ul>
            </div>
            <div class="col-md-3  footer-menu">
                <h4>NAVIGATE</h4>
                <ul>
                    <a href="index.html">
                        <li>Home</li>
                    </a>
                    <a href="about-me.html">
                        <li>About Me</li>
                    </a>
                    <a href="about-us.html">
                        <li>About Us</li>
                    </a>
                    <a href="our-team.html">
                        <li>Our Team</li>
                    </a>
                    <a href="blog-right-sidebar.html">
                        <li>Blog</li>
                    </a>
                    <a href="contact.html">
                        <li>Contact</li>
                    </a>
                </ul>
            </div>

        </div>
    </div>
</footer>

<!-- FOOTER 2 -->
<footer class="page-section-no-padding  footer2-container">
    <div class="container">
        <div class="row">
            <!-- Copyright -->
            <div class="col-xs-6">
                <p>Follow me on <a href="https://twitter.com/lautenschlagera" target="_blank">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                         style="fill: #38A1F3;">
                        <path d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z"></path>
                    </svg>
                </a></p>
                <p>Template created for free commercial use by Andreas Lautenschlager.<br>More free downloads under <a
                        href="https:/lautenschlager.de" target="_blank">lautenschlager.de</a></p>
                <a rel="license" href="http://creativecommons.org/licenses/by/4.0/" target="_blank"><img
                        alt="Creative Commons License" style="border-width:0"
                        src="https://i.creativecommons.org/l/by/4.0/88x31.png" class="fixed"></a><br>This work is
                licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/" target="_blank">Creative
                Commons Attribution 4.0 International License</a>.
            </div>

            <!-- Social Links -->
            <div class="text-right col-xs-6 footer2-social-container">
                <a href="#" title="Facebook" target="_blank"><i class="fa fa-facebook"></i></a>
                <a href="#" title="Google-plus" target="_blank"><i class="fa fa-google-plus"></i></a>
                <a href="#" title="Twitter" target="_blank"><i class="fa fa-twitter"></i></a>
                <a href="#" title="Behance" target="_blank"><i class="fa fa-behance"></i></a>
                <a href="#" title="Pinterest" target="_blank"><i class="fa fa-pinterest"></i></a>
                <a href="#" title="Youtube" target="_blank"><i class="fa fa-youtube"></i></a>
                <a href="#" title="Dribbble" target="_blank"><i class="fa fa-dribbble"></i></a>
            </div>
        </div>
    </div>
</footer>

<!-- Scripts -->
<!-- Loads Bootstrap Main JS -->
<script src="bootstrap/js/bootstrap.min.js"></script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>

<!-- Initiate Google Maps - For more Infos look into the documentation -->
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script src="js/google-map.js"></script>

<!-- Initiate Portoflio Script -->
<script src="extensions/portfolio/isotope.min.js"></script>
<script src="extensions/portfolio/portfolio.js"></script>

<!-- Initiate Fancybox/Lightbox Script -->
<!-- Fancybox/Lightbox -->
<script type="text/javascript" src="extensions/fancybox/jquery.fancybox.js"></script>
<script type="text/javascript" src="extensions/fancybox/jquery.fancybox.pack.js"></script>
<link rel="stylesheet" type="text/css" href="extensions/fancybox/jquery.fancybox.css" media="screen"/>
<script type="text/javascript" src="extensions/fancybox/jquery.fancybox-media.js"></script>
<!-- Initiate Fancybox/Lightbox for Videos -->
<script type="text/javascript">
    $(document).ready(function () {
        /*
         *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
         */
        $('.fancybox-media')
            .attr('rel', 'media-gallery')
            .fancybox({
                openEffect: 'none',
                closeEffect: 'none',
                prevEffect: 'none',
                nextEffect: 'none',
                arrows: false,
                helpers: {
                    media: {},
                    buttons: {}
                }
            });
    });
</script>

</body>

</html>