import boto3
id=[]
#hope it works
def startandstopinstances(event, context):
    aws_console=boto3.session.Session()
    ec2_client=aws_console.client(service_name="ec2",region_name="ap-south-1")
    for each_instances in ec2_client.describe_instances()['Reservations']:
        for each_item in each_instances['Instances']:
            id.append(each_item['InstanceId'])
    #yayy it worked
    print(id)
    response=ec2_client.stop_instances(InstanceIds=id)
