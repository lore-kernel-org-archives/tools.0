Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC467C
	for <tools@linux.kernel.org>; Mon, 24 Apr 2023 06:12:11 +0000 (UTC)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33O4uiMa031346
	for <tools@linux.kernel.org>; Mon, 24 Apr 2023 05:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : references : cc : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5Q3kyLTqbtf6vrYADRqKV/9PY2oLj6kofTJJSUc5wlA=;
 b=KzYWcVQtL5NOMSrNUYzg67NfdGqt/uRKebjQJXlmVX/FZTwfjNth2PKL0smXRbWlFHop
 Y0XEF7JczT8K25Fr00FNFQa88qcxNpRvW0HEcG75xivkJmhP4TzziN4qrCDXRO9f+AWG
 PQvej6cNccAssHnMTYmlJlokSXpd8z4mkPYx8FT6iO52MGyJUMdtVh/DVhByJuqdPPsW
 5Rn0G+2S5tzK0J3G1iglYWLTOWiPRrLT0BTX84lc8PS5ePhVUYg9f0Pb9NKokA7Zp2wP
 gV+2juqh+Ma6ka4a8LSILkowHDpMuW629Zy/kgp27QgUGu/I8SRL2fscbG90VHs+d/NN eA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q47r752tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <tools@linux.kernel.org>; Mon, 24 Apr 2023 05:34:08 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33O3idgD006395
	for <tools@linux.kernel.org>; Mon, 24 Apr 2023 05:31:11 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3q4778kvfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <tools@linux.kernel.org>; Mon, 24 Apr 2023 05:31:11 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33O5VAfw29819378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Apr 2023 05:31:10 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6494758065;
	Mon, 24 Apr 2023 05:31:10 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F10658052;
	Mon, 24 Apr 2023 05:31:09 +0000 (GMT)
Received: from [9.163.18.8] (unknown [9.163.18.8])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Apr 2023 05:31:09 +0000 (GMT)
Message-ID: <a8a5e5ca-b8f5-87ee-bca6-e86d26f36fca@linux.vnet.ibm.com>
Date: Mon, 24 Apr 2023 11:01:07 +0530
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: b4: request for adding support to get older revisions in b4 mbox
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
To: tools@linux.kernel.org
References: <2b01caf0-2a58-b21e-2b0f-5528aec16631@linux.vnet.ibm.com>
Cc: shrikanth hegde <sshegde@linux.vnet.ibm.com>
In-Reply-To: <2b01caf0-2a58-b21e-2b0f-5528aec16631@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HP0pjXn8SOMo7tC9sFvCcotEILC7ITW3
X-Proofpoint-ORIG-GUID: HP0pjXn8SOMo7tC9sFvCcotEILC7ITW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_02,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304240052



On 4/4/23 4:18 PM, Shrikanth Hegde wrote:
> Currently, the b4 mbox has a way to check for newer revisions.   
> 
> b4 mbox --help
> <...>
> -c, --check-newer-revisions
>                         Check if newer patch revisions exist
> 
> This would help to pull the later versions if exists based on the message-id. 
> This works as expected. If V1 of the series, it can pull all the way to latest.
> That is nice.
> 
> Pulling an older version of a PATCH series given a message-id is also very
> helpful. Quite often we come across a latest version of a patch series and 
> cover letter points that issue is described in details in V1 or V2 or so. 
> Finding that V1 might be tricky and take a bit of search.  
> 
> 
> Can we have that support? Does it make any sense? 
> 

Is this something worth taking a look? 

Seems like infra code is already there. a new option needs to be added. 
Is that possible? 


I did make the changes, But it doesn't reflect the code changes. there is lack
of info on how to compile and which is the target that would be built. 
If there is guide for how to compile and test, that would be helpful.

 
