Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by mx.groups.io with SMTP id smtpd.web12.17838.1585330466011881707
 for <tools@linux.kernel.org>;
 Fri, 27 Mar 2020 10:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oracle.com header.s=corp-2020-01-29 header.b=Q/AqAdim;
 spf=pass (domain: oracle.com, ip: 141.146.126.78, mailfrom: martin.petersen@oracle.com)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02RHNN1c054683;
	Fri, 27 Mar 2020 17:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=WtGn0W6GbRfLR7Ip6FaG10A7YDxRpegxwRBa+jm5PUM=;
 b=Q/AqAdim9LamdLgJxAoENHqwQN0WKWxMpR8NzKtA10/2Z0kDe73G2mrdzMJgNJMj1oij
 OUQXlWB4sF4ZmQEZ5qzQcp/vh4tczEBNkAioPhh974R7uDBTrcjs1DlaN7PTqmOKpuT2
 aKMBAXqLCC7ITaQRno9JRz5SBIkEmAMc59jpL4Tbw+naUT38k4+7+58rG2q/b5C7sRTh
 y1W/CqFlCPr2vje8OwiZdVxHXwwvEddB9xBUbkNGlE/QhguKmLQCy0pOKP3DSZIdE9O0
 t7SYuNv6fFSbMLG11hF0Ld8bMZi9XoQjbG+/Mzj63sDdv/vgkT4Y/TBhjV4hSiRcd8NK 7A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2120.oracle.com with ESMTP id 301m49gnay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Mar 2020 17:34:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02RHN3II075239;
	Fri, 27 Mar 2020 17:34:24 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 30073h9j5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Mar 2020 17:34:24 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02RHYNx1008717;
	Fri, 27 Mar 2020 17:34:23 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 27 Mar 2020 10:34:23 -0700
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: [kernel.org users] b4 version 0.3.5 released
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200327164537.wxfcj5f7xtwp574o@chatter.i7.local>
Date: Fri, 27 Mar 2020 13:34:20 -0400
In-Reply-To: <20200327164537.wxfcj5f7xtwp574o@chatter.i7.local> (Konstantin
	Ryabitsev's message of "Fri, 27 Mar 2020 12:45:37 -0400")
Message-ID: <yq1a741bt2b.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9573 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003270148
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9573 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003270148
Content-Type: text/plain


Hi Konstantin!

> Version 0.3.5 is a minor point release in the stable-0.3.y branch.  

I started noticing this a few commits back. Sometimes my SoB is being
added before the patch author's. The interesting thing is that it is
non-deterministic. I.e. if I run exactly the same b4 command several
times in a row, sometimes the ordering is correct, sometimes it's
reversed.

While repeating this in one terminal:

$ b4 am -s 20200327141954.955-1-ddiss@suse.de

I run this in another:

$ tail -F v3_20200327_ddiss_scsi_target_xcopy_performance.mbx | grep Signed-off
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: David Disseldorp <ddiss@suse.de>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: David Disseldorp <ddiss@suse.de>
[...]
Signed-off-by: David Disseldorp <ddiss@suse.de>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: David Disseldorp <ddiss@suse.de>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
[...]
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: David Disseldorp <ddiss@suse.de>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: David Disseldorp <ddiss@suse.de>
[...]

I think I'm cursed!

-- 
Martin K. Petersen	Oracle Linux Engineering
