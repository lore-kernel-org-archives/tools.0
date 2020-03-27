Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by mx.groups.io with SMTP id smtpd.web10.22620.1585342260899683033
 for <tools@linux.kernel.org>;
 Fri, 27 Mar 2020 13:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oracle.com header.s=corp-2020-01-29 header.b=izyapuT7;
 spf=pass (domain: oracle.com, ip: 156.151.31.85, mailfrom: martin.petersen@oracle.com)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02RKma05002937;
	Fri, 27 Mar 2020 20:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=bjI2Rz6erVn5Rt53V0FZIBTTm5llWkPs7FA6k2zgxO8=;
 b=izyapuT7wvEMv3zDGhrgCbXDhY+tQYSxoxYI4BXSONIMbTyjbVJRpwmOEmskddZ9kQX1
 M+MBQXYgW75KBhha9/GpiiN7o5n+MIhar2Nk+wOCeA2AA2MwzinRwyfomS1G2X6fbhqf
 drHW7UHrvbYocFzdW3+orTIrwNt6FMQ8CSxijlWbUKoocyXouKCaKNnirVanHm4y0MeQ
 +yw8fIS5jIs4GAiJIlEmMkDk1XycIJ3vIotPmszSLhoAbot0ZWiuqaQ0Bx70EqufiScc
 FGbmBgL2JBg55/bRreIEYVUglu9RpDM7BEg2ofojJRl3yueYFNXWk1q6Z2Iae6sXXZ8U Ww== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2120.oracle.com with ESMTP id 3019veccfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Mar 2020 20:51:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02RKnuVL094986;
	Fri, 27 Mar 2020 20:50:59 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3020.oracle.com with ESMTP id 3003gpngfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Mar 2020 20:50:59 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02RKovF7019529;
	Fri, 27 Mar 2020 20:50:58 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 27 Mar 2020 13:50:57 -0700
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
        users@linux.kernel.org
Subject: Re: [tools] [kernel.org users] b4 version 0.3.5 released
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200327164537.wxfcj5f7xtwp574o@chatter.i7.local>
	<yq1a741bt2b.fsf@oracle.com> <16003A554CE54555.17905@linux.kernel.org>
	<20200327180414.bggwsgfa2k3yqmz4@chatter.i7.local>
Date: Fri, 27 Mar 2020 16:50:55 -0400
In-Reply-To: <20200327180414.bggwsgfa2k3yqmz4@chatter.i7.local> (Konstantin
	Ryabitsev's message of "Fri, 27 Mar 2020 14:04:14 -0400")
Message-ID: <yq1mu81a5e8.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9573 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=907 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003270171
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9573 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=983
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003270171
Content-Type: text/plain


Konstantin,

> The latest commit (in master and stable-0.3.y) should fix this.

No gremlins to be found. Thanks much!

-- 
Martin K. Petersen	Oracle Linux Engineering
