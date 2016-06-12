for file in */
do
    count=$(awk 'NF' $file/HelpshiftLocalizable.strings | awk -F= '{print $1}' | sort | uniq -c | grep -v 1 | wc -l)
    if [ $count -gt 0 ]
    then
       echo "Verification of $file/HelpshiftLocalizable.strings file failed !"
       exit 1
    fi
done

