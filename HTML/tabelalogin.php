<!DOCTYPE html>
<html>

<head>
    <title>login</title>
    <!-- Favicon-->
   
</head>

<body >
    </section>


    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
            </div>
            <!-- Basic Examples -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                               Cadastros
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                    <thead>
                                        <tr>
                                            <th>Email</th>
                                            <th>Senha</th>
                                          
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <?php
require ("conectbd.php");

$resultado = mysqli_query($link, "SELECT * FROM login");
while ($cont = mysqli_fetch_array($resultado)) {
    $cogigologin = $cont['cogigologin'];
    $email = $cont['email'];
    $senha = $cont['senha'];
echo "
<tr>
    
   <td>$coordenador</td>
   <td>$senha</td>

   <td><a href=\"edit_login.php?cogigologin=$cogigologin\">[Editar]</a></td>
   <td><a href=\"del_login.php?cogigologin=$cogigologin\">[Deletar]</a></td>
</tr>
";

}

?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Basic Examples -->
            
        </div>
    </section>
</body>

</html>