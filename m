Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by mx.groups.io with SMTP id smtpd.web10.5975.1589291432039892293
 for <tools@linux.kernel.org>;
 Tue, 12 May 2020 06:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oracle.com header.s=corp-2020-01-29 header.b=Ooz/lUnO;
 spf=pass (domain: oracle.com, ip: 156.151.31.85, mailfrom: martin.petersen@oracle.com)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04CDlV5D134834;
	Tue, 12 May 2020 13:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=dJLx1v25fU2h8FOBYGw4hUqXZSShozjZS0tH+sWidZk=;
 b=Ooz/lUnOmnZkZkqLA3y7DyUSb1k8NbBdpgBJnr3zNsP/1PscVJGkF+SI3h4kVvBs8hpB
 8CmxkuFCq2HZpTU1LwWMSC8YhSqVGZgwyY7QlM1w1PThBWQodyxBQ55MxRQ6fYKmZuFO
 yX8LLbR3xG22Hh3B+JaNRaFRjd5fsmmc+cx94t4/RUNVCR1SYZArFe87AYvGaDeId/Yy
 NllOybIuKqJiHybIAuIL2tQTm38LbjCUkSfOI+Z6i/Wv0paK3n5Vy5UBM9dJ9XYTOa7J
 7axCns5bn9uALOxyDgMi7NTqHFShCTdKbRTLSAnnI7GhTp77DYljcnsV0+ppRSZgRKuH GA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 30x3mbu37c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 May 2020 13:50:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04CDiZ4s093183;
	Tue, 12 May 2020 13:50:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3020.oracle.com with ESMTP id 30xbgjp7t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 May 2020 13:50:30 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04CDoQ0R018878;
	Tue, 12 May 2020 13:50:27 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 12 May 2020 06:50:26 -0700
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [tools] b4 0.4.1 available with bugfixes and minor improvements
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200508191929.5l2jzw42fjz47jb4@chatter.i7.local>
Date: Tue, 12 May 2020 09:50:24 -0400
In-Reply-To: <20200508191929.5l2jzw42fjz47jb4@chatter.i7.local> (Konstantin
	Ryabitsev's message of "Fri, 8 May 2020 15:19:29 -0400")
Message-ID: <yq1d0792rfj.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9618 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005120103
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9618 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 impostorscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005120103
Content-Type: text/plain


Hi Konstantin!

> - ty: is less naive about mapping local to remote branches when using
> them in templates

My ${branch} now ends up being "master" because my trees are based on
Linus' -rc1. Prior to Will's change, ${branch} emitted the local branch
name.

Maybe I could just drop tracking linus/master, I guess I do that mainly
out of habit. Not sure I've ever actually had to rebase to a later -rc.

But since b4-treename is already configurable, maybe we could have a
matching b4-branch option? Another approach would be a "these aren't the
remotes you are looking for" command line argument.

Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
