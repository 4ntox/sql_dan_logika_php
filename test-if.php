<?php

// quis 2

$b1 = 20000;
$b2 = 30000;
$b3 = 50000;
$beli = 3;
$barang = $b1;
$total = $beli*$barang;
$disc_b3 = $total*20/100;

// $disc = 0;


if ($total > 75000 && $barang != $b3) {
              
        $disc = $total*15/100;


}

else if ($total > 75000 && $barang == $b3) {
    
        $disc = $disc_b3;


}

else if ($total < 75000 && $barang == $b3) {
    $disc = $disc_b3;
}

else {
        $disc = 0;
}

    

echo "harga barang 1 = " .$b1;
echo "<br/>";
echo "harga barang 2 = " .$b2;
echo "<br/>";
echo "harga barang 3 = " .$b3;
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "Harga Barang Yang dibeli = " .$barang;
echo "<br/>";
echo "Jumlah Beli = " .$beli;
echo "<br/>";
echo "Total = " .$total;
echo "<br/>";
echo "diskon = " .$disc;
echo "<br/>";



$totalbyr = $total - $disc;

echo "<br/>";
echo " Total Bayar = Rp " .$totalbyr;
?>