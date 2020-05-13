Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by mx.groups.io with SMTP id smtpd.web10.1105.1589330139549633709
 for <tools@linux.kernel.org>;
 Tue, 12 May 2020 17:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oracle.com header.s=corp-2020-01-29 header.b=UxppBYCU;
 spf=pass (domain: oracle.com, ip: 156.151.31.85, mailfrom: martin.petersen@oracle.com)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04D0Y0xL095735;
	Wed, 13 May 2020 00:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=LG1m6u7NtBntHMgNQ39cKlfql2AnAm3DazSpOU8vFj4=;
 b=UxppBYCUcT3SYWhPlkEujMJyhNy3w+jETIlv8RGmVoXBAXYCrVEMKReM6I1aIFwBLp2u
 DxSOw/O3a+pRv0Zcxt3A6AhM5fyaBH40BcAq5N41r6JUQEQNYJyjX2zMPvyGP/Jan++q
 klYwYFeCOvUPSYPCNPKJbJQiP2kyBFtM7etChRyMFINRDLp4jV3hi3PURowE74398Ou1
 V3yQSwsv/ZlR8LPyyPJKdtehn0SWwygjwG0g1DiwgNxKsebsDluS+nnPzv/4x7adIBDX
 gokXPGoQ8UGVuAj3J4psYWJl9Otb9y/Hd3nMKAwrG6aPVcabNyecS2mO9cwMBAoPWb7d 4g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 3100xwhcmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 May 2020 00:35:38 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04D0Xna7173525;
	Wed, 13 May 2020 00:35:38 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3030.oracle.com with ESMTP id 3100y9dtve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 May 2020 00:35:37 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04D0Zb9U009422;
	Wed, 13 May 2020 00:35:37 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 12 May 2020 17:35:36 -0700
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [tools] b4 0.4.1 available with bugfixes and minor improvements
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200508191929.5l2jzw42fjz47jb4@chatter.i7.local>
	<yq1d0792rfj.fsf@oracle.com>
	<20200512135724.m5qqjogcnpivzyo4@chatter.i7.local>
Date: Tue, 12 May 2020 20:35:35 -0400
In-Reply-To: <20200512135724.m5qqjogcnpivzyo4@chatter.i7.local> (Konstantin
	Ryabitsev's message of "Tue, 12 May 2020 09:57:24 -0400")
Message-ID: <yq1eero1xk8.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9619 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=925 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005130002
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9619 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 cotscore=-2147483648 bulkscore=0
 phishscore=0 adultscore=0 mlxlogscore=975 lowpriorityscore=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005130002
Content-Type: text/plain


Hi Konstantin!

> I literally *just* pushed out 0.4.2 that fixes that bug (and fixes the
> --auto mode). Please try that out.

Latest still picks "master" in my case. I'm not even sure how b4 would
be able to distinguish between the two workflows (tracking a baseline
tree vs. a remote publishing branch)?

Dropping linus as a remote works. I don't really need the tracking so
that's what I'll do for now. Not a big deal.

-- 
Martin K. Petersen	Oracle Linux Engineering
