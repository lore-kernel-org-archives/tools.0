Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by mx.groups.io with SMTP id smtpd.web12.212.1588130865972524037
 for <tools@linux.kernel.org>;
 Tue, 28 Apr 2020 20:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oracle.com header.s=corp-2020-01-29 header.b=DydPO7Pc;
 spf=pass (domain: oracle.com, ip: 156.151.31.86, mailfrom: martin.petersen@oracle.com)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03T3HO8e015201;
	Wed, 29 Apr 2020 03:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=17hddnKjN9MrzO9CKdj9xsPP4rMrTvaamfWLO73zKYQ=;
 b=DydPO7Pcibky6QzXieq9koW2MjM0o5PRF+PyOEnYU3tfNZY9ZWfa/7sWDMF5lO1t2D99
 dtXN8QRb0+c8HY8WZasu5Z2/qmK9epv2wQh0nBM2hMNpvWqWTW7PWp29d5zXltJcjidW
 6edliex7bXpYE80X7yIBfDejJB08wU3xhHMvPtjFLEGxBEsyAxgOzkvooziBabw499xD
 zLrXT1zO1caEa6VMXr9ROQeUMJUmMHqOaT1RD2KMoAq5h8uhAoTZAipP1/Dl3CHK0uDg
 lG1J3VQuClkyfhYVqc2CR46rjPMBLkoCeGEKWFFHkX5SiNQZnInCYpN7MeyrBeQWJU9b 3g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2130.oracle.com with ESMTP id 30p01nswmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Apr 2020 03:27:45 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03T3D18T148020;
	Wed, 29 Apr 2020 03:25:44 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3020.oracle.com with ESMTP id 30my0fb6sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Apr 2020 03:25:44 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03T3PgGb021311;
	Wed, 29 Apr 2020 03:25:42 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 28 Apr 2020 20:25:42 -0700
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
        users@linux.kernel.org
Subject: Re: [tools] b4 v0.4.0 available with new features
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
	<yq1lfmkbgoi.fsf@oracle.com>
	<20200427184051.ol7znhab6khqvjas@chatter.i7.local>
	<yq11ro89x54.fsf@oracle.com>
	<20200428151656.5qz5yiclxmffcnga@chatter.i7.local>
Date: Tue, 28 Apr 2020 23:25:40 -0400
In-Reply-To: <20200428151656.5qz5yiclxmffcnga@chatter.i7.local> (Konstantin
	Ryabitsev's message of "Tue, 28 Apr 2020 11:16:56 -0400")
Message-ID: <yq1ees77z2j.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290023
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004290023
Content-Type: text/plain


Konstantin,

> Interesting -- did you modify the subjects of those commits as well?  
> We're already falling back to matching by subject when we can't find 
> exact patch-id matches.

I had a couple of cases where I didn't and still got failures. I tried
tweaking the b4 files in .local to match the updated subject to see if I
could convince it to proceed that way but no such luck.

In any case: I do modify subject and commit descriptions for a
substantial amount of the patches I apply. Lots of typos, missing scsi:
tag, wrong driver tag, excessively long lines, etc. I have a hook script
that does a bunch of sanity checking on each patch and won't let me
apply until all issues are addressed.

> b4 ty -s 1,2,3
>
> will always generate a .thanks file for those series, and will omit 
> comit-id information when not found.
>
> Does that sound okay?

Sure. If you could still emit the %{summary} boilerplate with XXXXXXXX
as commit hash so it's easy to update afterwards, that would be great.

Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
