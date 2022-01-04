#!/usr/bin/perl
#To find minimum of numbers
sub minimum(@) {
    my $m = $_[0];
    for (@_) {
        $m = $_ if $_ < $m;
    }
   return $m;
}
#To calculate edit distance between input word and word in dictionary
sub editdistance {
    my @arra = split //, shift;
    my @arrb = split //, shift;
    my @c;
    for ( my $k = 0; $k <= @arra; $k++){
        $c[$k][0] = $k;
    }
    for ( my $x = 0; $x <= @arrb; $x++){
        $c[0][$x] = $x;
    }
     for ( my $i = 1; $i <= @arra; $i++){
         for ( my $j = 1; $j <= @arrb; $j++){       
             if( $arra[$i-1] eq $arrb[$j-1] ){
                  $c[$i][$j] = $c[$i-1][$j-1];
             }
             else {
                 $c[$i][$j] = 1 + minimum($c[$i-1][$j],$c[$i][$j-1],$c[$i-1][$j-1]);
             }
        }
    }

    return $c[@arra][@arrb];
}
$sentence = <STDIN>;
@tokens=  split(/ /, $sentence);
for ( $m=0 ; $m < @tokens ;$m++) {
chomp $tokens[$m];
$words = $tokens[$m];
chomp $words;
my @dict;
my @distarr;
open(FH, '<', 'dictionary.txt') or die $!;
$n=0;
while(<FH>){
   #print $_;
   $dict[$n]=$_;
   chomp $dict[$n];
   $distarr[$n] = editdistance($words,$dict[$n]);
   $n++;
   #print $dict[n];
} 
close(FH);
#sorting words on basis of edit distance
for ( my $i = 0; $i < $n; $i++){
   for ( my $j=0; $j< $n -$i -1 ;$j++){
       if($distarr[$j] > $distarr[$j + 1]){
            $temp1 = $distarr[$j];
            $distarr[$j] = $distarr[$j +1];
            $distarr[$j +1] = $temp1;
            $temp2 = $dict[$j];
            $dict[$j] = $dict[$j +1];
            $dict[$j +1] = $temp2;
       }
   }
}
$t=0;
$corrected=0;
$wordslength=length($words);
if ($distarr[0] == 0){
   $corrected=1;
   print "No typo detected in $words\n";
}
else {
do {
 print "$words\n";
 $replacementlen=length($dict[$t]);
 $z=0;
 $done=0;
 for( my $z=0 ; $z<$wordslength and $z< $replacementlen ; $z++ )  {
    $r=substr($words, $z, 1);
    $s=substr($dict[$t], $z, 1);
    if( $r ne $s ){
      #print "$r   $s\n";
      $done=1;
      printf "%*s\n",$z+1,"^";
      last;
    }
 }
 if ($done == 0){
     printf "%*s\n",1+minimum($wordslength,$replacementlen),"^";
 }
 print "Detected possible typo! Did you mean $dict[$t] ?(Y/N)\n";
 $choice = <STDIN>;
 chomp $choice;
 if ( $choice eq 'Y' or $choice eq 'y' ){
     print "$words corrected to $dict[$t]\n";
     $words = $dict[$t];
     $tokens[$m]=$dict[$t];
     $corrected=1;
 }
 #print $dict[$t];
 #print "?\n";
 $t++;
}while( ( $distarr[$t] == $distarr[$t - 1 ] or $distarr[$t] == 2 ) and $corrected == 0 );
}
if ( $corrected == 0)
{ 
   print "Sorry! No suitable replacement word found\n"
}
}
print "After corrections:\n";
for ( $g=0 ; $g <@tokens ; $g++){
    print "$tokens[$g] ";
}
print "\n";
#print $words,"\n"
