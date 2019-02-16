<?php include "classes.php" ?>
<?php
$SecurityUserId = SessionManager::getSecurityUserId();
if($_SERVER["REQUEST_METHOD"] == "GET"){
    isset( $_GET["id"]) ? $blogcategoryid =  $_GET["id"] : $blogcategoryid =  null;
    $blogList = Blog::search(null,null,null,null,$blogcategoryid,null,null,null);
}
?>
<!DOCTYPE html>
<html lang="en">

<?php include "head.php" ?>

<body>

<!-- Navigation -->
<?php include "navbar.php" ?>

<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Blog
        <!--<small>Subheading</small>-->
    </h1>

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="index.php">Home</a>
        </li>
        <li class="breadcrumb-item active">Blog</li>
    </ol>

    <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-8">
            <?php
            if(!empty($blogList)){
                foreach ($blogList as $b){
                    ?>
                    <!-- Blog Post -->
                    <div class="card mb-4">
                        <a href="blog-post.php?id=<?php echo $b->getId() ?>">
                            <img class="card-img-top" src="<?php echo $b->getImgUrl() ?>" alt="Card image cap">
                        </a>
                        <div class="card-body">
                            <h2 class="card-title"><?php echo $b->getTitle() ?></h2>
                            <p class="card-text"><?php echo nl2br(substr($b->getDescription(), 0, 300)) ?>...</p>
                            <a href="blog-post.php?id=<?php echo $b->getId() ?>" class="btn btn-primary">Read More &rarr;</a>
                            <?php
                            //if($SecurityUserId){
                                ?>
                                <!--<a href="create-blog.php?cmd=edit&id=<?php echo $b->getId() ?>" class="btn btn-danger">Edit Blog</a>-->
                                <?php
                            //}
                            ?>
                        </div>
                        <div class="card-footer text-muted">
                            Posted on <?php echo date_format(date_create($b->getCreateDate()), 'g:ia \o\n l jS F Y') ?> by
                            <a href="#"><?php
                                $user = new Securityuser($b->getSecurityUserId());
                                echo $user->getUsername() ?></a>
                        </div>
                    </div>
                    <?php
                }
            }
            ?>

            <!-- Pagination -->
            <ul class="pagination justify-content-center mb-4">
                <li class="page-item">
                    <a class="page-link" href="#">&larr; Older</a>
                </li>
                <li class="page-item disabled">
                    <a class="page-link" href="#">Newer &rarr;</a>
                </li>
            </ul>

        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

            <!-- Search Widget
            <div class="card mb-4">
              <h5 class="card-header">Search</h5>
              <div class="card-body">
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="Search for...">
                  <span class="input-group-btn">
                    <button class="btn btn-secondary" type="button">Go!</button>
                  </span>
                </div>
              </div>
            </div>-->

            <!-- Categories Widget -->
            <div class="card my-4">
                <h5 class="card-header">Categories</h5>

                <div class="card-body">
                    <div class="row">
                        <?php
                        $blogCategoryLiat = Blogcategory::loadall();
                        if(!empty($blogCategoryLiat)){
                            foreach ($blogCategoryLiat as $bc) {
                                ?>
                                <div class="col-lg-6">
                                    <a href="blog-home.php?id=<?php echo $bc->getId() ?>"><?php echo $bc->getName() ?></a>
                                    <?php
                                    if($SecurityUserId > 0){
                                        ?>
                                        <a href="create-type.php?cmd=edit&type=blogcategory&id=<?php echo $bc->getId() ?>"class="text-danger"><i class="icon-pencil"></i></a>
                                        <?php
                                    }
                                    ?>
                                </div>
                                <?php
                            }
                        }
                        ?>
                    </div>
                </div>
            </div>

            <!-- Side Widget -->
            <div class="card my-4">
                <h5 class="card-header">Side Widget</h5>
                <div class="card-body">
                    You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
                </div>
            </div>

        </div>

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<?php include "footer.php" ?>

<!-- Bootstrap core JavaScript -->
<?php include "scripts.php" ?>

</body>

</html>
