Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by mx.groups.io with SMTP id smtpd.web10.2708.1587771347870553116
 for <tools@linux.kernel.org>;
 Fri, 24 Apr 2020 16:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oracle.com header.s=corp-2020-01-29 header.b=VHr0VISq;
 spf=pass (domain: oracle.com, ip: 156.151.31.86, mailfrom: martin.petersen@oracle.com)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03ONX0ot124276;
	Fri, 24 Apr 2020 23:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=GGz1IknI23wpLcO7rTVH2Kq3xdCMP5nN2uNt9pTMv6I=;
 b=VHr0VISqgK3GAzyaK2zz5GlkhlGYlGkpRFXCooQ+hk/PcirxaH2DTsPQ9jAfp/XChw7N
 mGXWJ0ToCfIjWuz2uJ6t0rClCavQtIGGIUrUb37mnJcE0h0hovclrgqp0iZeoEbb1SRa
 AfjIb+LkxGB93ZK/N82FUii6L2/ciPsO/Q5/wK1DGIlt3dEaShzFVCXa74KYUAHjEAWF
 pa4D98nOFHaSc9meWAHkDEsQHorJqSvzySszoX9tRa+Euv6vBLZtf1BVpOcD1ctHOoIj
 3TdiDpZsiv0PiMzGmdYce4JtqXrv7UYlM6gzAe4TTGfDRCfJEU+u1W2Pme2TYSXjOCAq +w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 30ketdpvxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Apr 2020 23:35:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03ONVef3017869;
	Fri, 24 Apr 2020 23:35:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 30k7qy6f7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Apr 2020 23:35:45 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03ONZiGh008972;
	Fri, 24 Apr 2020 23:35:45 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 24 Apr 2020 16:35:44 -0700
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [tools] b4 v0.4.0 available with new features
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
Date: Fri, 24 Apr 2020 19:35:41 -0400
In-Reply-To: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local> (Konstantin
	Ryabitsev's message of "Fri, 24 Apr 2020 13:04:42 -0400")
Message-ID: <yq1lfmkbgoi.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9601 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004240178
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9601 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240178
Content-Type: text/plain


Hi Konstantin!

> ## b4 ty
>
> Allows you to automate a lot of "thanks, applied" and "thanks, merged"
> feedback for series and pull requests that were fetched with "b4 am"
> and "b4 pr".

I just merged a bunch of one-liners and the "thank you" quote ends up
being:

    > Fix the following coccicheck warning:
    > 
    > drivers/scsi/foo/bar/baz.c
    > 
    > Link: https://lore.kernel.org/r/...
    > Reported-by: ...
    > Reviewed-by: ...
    > Signed-off-by: ...
    > Signed-off-by: ...

It would be nice if the quoting function could ignore the trailers
portion of the mail and not just stuff below "---".

Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
