Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by mx.groups.io with SMTP id smtpd.web10.144.1588039933165317606
 for <tools@linux.kernel.org>;
 Mon, 27 Apr 2020 19:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oracle.com header.s=corp-2020-01-29 header.b=cZNWtS/l;
 spf=pass (domain: oracle.com, ip: 156.151.31.86, mailfrom: martin.petersen@oracle.com)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03S29Fs0186278;
	Tue, 28 Apr 2020 02:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=LczZ0W/ZUSvNYHyPt0hkk1Ea5VqdXu/0eA+6/qGRfMo=;
 b=cZNWtS/luyOLAGOA1b7kbvcFExOAMXKSKqTWneIR4wluE6DQiF5on55OWR3X8QzLbMVY
 e9JzzW2TlWMC8HJJEK5kSXFst/NvUJLgD+g1C3Uh24rW03BjorOBJXWjS9gDj6kbv7Db
 XBYNV9aInluSL0mMe+thvIr8iWepzFe0/FoEDh+jvtZGClJtIOgQQaHXtwn9vVpzJPOv
 /7xP4r3inVTfwAbnjH853wlZTkGRagghFhCqkHwjWkk9hsLDJhfo1Wp/aF0C8hnMgQSP
 AXCIDvjFAbTb1ATKlMpeXDeErTES8hgt+A/Zx+tWFiyydnEnz0bUys9jBd4XUO7hkRa5 Jg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 30p01nkj8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Apr 2020 02:12:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03S289aM047659;
	Tue, 28 Apr 2020 02:12:11 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 30mxrrg8tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Apr 2020 02:12:11 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03S2CAJu016784;
	Tue, 28 Apr 2020 02:12:10 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 27 Apr 2020 19:12:09 -0700
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, users@linux.kernel.org,
        tools@linux.kernel.org
Subject: Re: [tools] b4 v0.4.0 available with new features
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
	<yq1lfmkbgoi.fsf@oracle.com>
	<20200427184051.ol7znhab6khqvjas@chatter.i7.local>
Date: Mon, 27 Apr 2020 22:12:07 -0400
In-Reply-To: <20200427184051.ol7znhab6khqvjas@chatter.i7.local> (Konstantin
	Ryabitsev's message of "Mon, 27 Apr 2020 14:40:51 -0400")
Message-ID: <yq11ro89x54.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9604 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004280015
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9604 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004280015
Content-Type: text/plain


Konstantin,

> Yep, good point. The latest master and stable-0.4.y should do a better
> job at making these quotes. Tested on:

Works great, thank you!

Second issue:

I have had a few cases today where my merge edits meant that b4 ty
couldn't match the original patch-id up with a commit in my tree.

I can see the patches in question with b4 ty --list but b4 ty -s N
fails because no match can be found. It would be nice to have a way to
specify a commit hash and have b4 still write a .thanks file even when
the patch-id matching fails. Something like:

$ b4 ty -s 10 -c <SHA>

would produce the thank you note with <SHA> as the ${summary} commit
link.

It would also be great for the matching to be more forgiving (capturing
per-patch message-id and matching with Link: tag, for instance). But I
still think I might end up in situations where I would like to be able
to force a thank you note given a ty id number and a commit hash.

Just an idea...

Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
