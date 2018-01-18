<form method="post" name="frm" class="margin-top-15 box-article">
    {{ csrf_field() }}
    <input type="hidden" name="username" value="<?php echo @$data["username"]; ?>" />
    <h2 class="tieu-de-bai-viet">
        Đổi mật khẩu
    </h2>
    <?php                           
    if(count($error) > 0 || count($success) > 0){
        ?>
        <div class="alert-system margin-top-15">
            <?php                                           
            if(count($error) > 0){
                ?>
                <ul class="alert-error">
                    <?php 
                    foreach ($error as $key => $value) {
                        ?>
                        <li><?php echo $value; ?></li>
                        <?php
                    }
                    ?>                              
                </ul>
                <?php
            }
            if(count($success) > 0){
                ?>
                <ul class="alert-success">
                    <?php 
                    foreach ($success as $key => $value) {
                        ?>
                        <li><?php echo $value; ?></li>
                        <?php
                    }
                    ?>                              
                </ul>
                <?php
            }
            ?>                                              
        </div>              
        <?php
    }
    ?>
    <table class="com_product30 margin-top-15" border="0" width="80%" cellpadding="0" cellspacing="0">                   
        <tbody>        
            <tr>
                <td align="right">Tài khoản</td>
                <td><?php echo @$data["username"]; ?></td>        
            </tr>                           
            <tr>
                <td align="right">Mật khẩu</td>
                <td><input type="password" name="password"  /></td>        
            </tr>
            <tr>
                <td align="right">Xác nhận mật khẩu</td>
                <td><input type="password" name="password_confirm" /></td>        
            </tr>   
            <tr>           
                <td></td>
                <td class="com_product31" align="right">
                    <div class="box-readmore">
                        <a href="javascript:void(0);" onclick="document.forms['frm'].submit();">Gửi</a>       
                    </div>                          
                </td>                       
            </tr> 
        </tbody>    
    </table>
</form>
