Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DAE7C
	for <tools@linux.kernel.org>; Tue,  4 Apr 2023 10:48:47 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3349vBec016376
	for <tools@linux.kernel.org>; Tue, 4 Apr 2023 10:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : to : from : subject : content-type :
 content-transfer-encoding; s=pp1;
 bh=ER52C4HL7aX144lLhcZC2KLgZcb9GALvED9s1mQXwBY=;
 b=E8GYADAhORdG5RqoZ0CcPXVZ0hcnTXxJOtFB09oeXjfL5TnHuPHdm9W0xWXlH0WyZbU0
 KxmSNEVTzgqKZ9MnsOR7pt8ON7WLR0uUhrqOHmgtqLYhNlHEfyFSnbMdE0MqjLRVd6Zt
 oe+XVfZufuOmF/KFZmB+YnTyI/mhQRSLv5P4/EmOazs6TP2uRTihxFBWIxkkJbBnBklj
 CikdUnuuPZN8aA56honHvkSUjq0ajhgGH2kxWTDPSoR1IZc0PNKC8MibMHhYijazWGyA
 1QnwdU42b7TKWnZ4C86euBFbg7ipALhPZZOqfewYT218OpeRWxYTmd/kl37GUbD/rqDY +Q== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3prhqd188t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <tools@linux.kernel.org>; Tue, 04 Apr 2023 10:48:40 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 334860xi009612
	for <tools@linux.kernel.org>; Tue, 4 Apr 2023 10:48:40 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3ppc87rghs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <tools@linux.kernel.org>; Tue, 04 Apr 2023 10:48:40 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 334AmcYY35783176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <tools@linux.kernel.org>; Tue, 4 Apr 2023 10:48:39 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2CEE58060
	for <tools@linux.kernel.org>; Tue,  4 Apr 2023 10:48:38 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1270B5803F
	for <tools@linux.kernel.org>; Tue,  4 Apr 2023 10:48:38 +0000 (GMT)
Received: from [9.109.201.126] (unknown [9.109.201.126])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP
	for <tools@linux.kernel.org>; Tue,  4 Apr 2023 10:48:37 +0000 (GMT)
Message-ID: <2b01caf0-2a58-b21e-2b0f-5528aec16631@linux.vnet.ibm.com>
Date: Tue, 4 Apr 2023 16:18:35 +0530
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: tools@linux.kernel.org
From: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
Subject: b4: request for adding support to get older revisions in b4 mbox
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gi65T2qbUzldnM-spAtEnTCloz1nTF6a
X-Proofpoint-GUID: gi65T2qbUzldnM-spAtEnTCloz1nTF6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_03,2023-04-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=765
 lowpriorityscore=0 mlxscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040097

Currently, the b4 mbox has a way to check for newer revisions.   

b4 mbox --help
<...>
-c, --check-newer-revisions
                        Check if newer patch revisions exist

This would help to pull the later versions if exists based on the message-id. 
This works as expected. If V1 of the series, it can pull all the way to latest.
That is nice.

Pulling an older version of a PATCH series given a message-id is also very
helpful. Quite often we come across a latest version of a patch series and 
cover letter points that issue is described in details in V1 or V2 or so. 
Finding that V1 might be tricky and take a bit of search.  


Can we have that support? Does it make any sense? 

Thanks
Shrikanth 
