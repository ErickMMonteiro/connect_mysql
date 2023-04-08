<h1>Veiculo</h1>

<p> Cadastro de Veículos </p>

<?php
    $host = 'localhost';
    $user = 'root';
    $pwd = '';
    $database = 'bd_reservas';
    $porta = 3306;

    $con = mysqli_connect($host, $user, $pwd, $database, $porta);

    if (!$con) {
        die('Falha ao conectar com o Mysql!! ');
    }

    $db = mysqli_select_db($con, $database);
    $sql = "select * from veículo";
    $res = mysqli_query($con, $sql);
    ?>

    <h1 style="color:blue;">Consulta de Cadastro de Veículos</h1>

    <table border="1">
        <h3>Veículo</h3>
        <tr style="background-color:royalblue; color:white;">
            <th>ID</th>
            <th>NOME</th>
            <th>ANO</th>
            <th>KM</th>
        </tr>

        <?php
        while ($linha = mysqli_fetch_array($res)) { ?>
            <tr>
                <td><?php echo $linha['ID']; ?></td>
                <td><?php echo $linha['NOME']; ?></td>
                <td><?php echo $linha['ANO']; ?></td>
                <td><?php echo $linha['KM']; ?></td>
            </tr>
        <?php } ?>
    </table>

    <br>

    <table border="1">
        <h3>Reserva</h3>
        <tr style="background-color:royalblue; color:white;">
            <th>ID</th>
            <th>DATA</th>
            <th>MOTIVO</th>
            <th>ID_VEICULO</th>
            <th>ID_COLABORADOR</th>
        </tr>

        <?php
        $res = mysqli_query($con, 'Select * from reserva');
        while ($linha = mysqli_fetch_array($res)) { ?>
            <tr>
                <td><?php echo $linha['ID']; ?></td>
                <td><?php echo $linha['DATA']; ?></td>
                <td><?php echo $linha['MOTIVO']; ?></td>
                <td><?php echo $linha['ID_VEÍCULO']; ?></td>
                <td><?php echo $linha['ID_COLABORADOR']; ?></td>
            </tr>
        <?php } ?>
    </table>

    <br>

    <table border="1">
        <h3>Colaborador</h3>
        <tr style="background-color:royalblue; color:white;">
            <th>ID</th>
            <th>NOME</th>
            <th>NUMERO CNH</th>
        </tr>

        <?php
        $res = mysqli_query($con, 'Select * from colabor');
        while ($linha = mysqli_fetch_array($res)) { ?>
            <tr>
                <td><?php echo $linha['ID']; ?></td>
                <td><?php echo $linha['NOME']; ?></td>
                <td><?php echo $linha['NR_CNH']; ?></td>
            </tr>
        <?php } ?>
    </table>