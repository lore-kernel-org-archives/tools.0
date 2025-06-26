Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325442E4274
	for <tools@linux.kernel.org>; Thu, 26 Jun 2025 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950226; cv=none; b=sSupixruNdzynC1S7GoTVM4clIWKHkl4BGgufkRZ6W02ASSXllp6tG/U3kGhKJpDwxI4TrJersbDQqoxBE34LvmTsRJP8BLVDBg9KqJyi9klRUpS9BJba9RHrop2/TABUHoWw+Mkkptw57rrz+LhBLDVLWyJ8Z9KoaBnUkXxkso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950226; c=relaxed/simple;
	bh=/02ji93IXIVoXu649y2+reNC2/wKfkUlJ3twfprwnvw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hht3bz2ICB5UYGBJZbtgk3ru7TDWHx24zfLNiy7BzuYfURpI52BKHDDaNijyTKhtXGOniAh/2Klzdox2G1nY1za9S3ExNaEKYkyYj7o0ZNc3mrmvuAvQUgilkKSUUTZkir/+AgyOxYY+cF5/0zxKkfvjUcCYNGGqm2ZKhuuqUok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TaRz4g3h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TaRz4g3h"
Received: by smtp.kernel.org (Postfix)
	id D8235C4CEEE; Thu, 26 Jun 2025 15:03:45 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EEF64C4CEEB
	for <tools@kernel.org>; Thu, 26 Jun 2025 15:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EEF64C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QDR7cx023901;
	Thu, 26 Jun 2025 15:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	pp1; bh=yiRonLpS5oU6eLPK41O25JkjPLEHzKSazmJkE1incrc=; b=TaRz4g3h
	eh8459u5TgjnZJagu9dE0SfY1Pk6lNfcXXqdueCZNAEDI94krEw+KMPT2Gq+etjP
	f/WEx6z3g8yVZcWmDoAaGyhts07PLfU41HK4LFXM382c3ArJPRlUtTCITVXpovr5
	4B5fl38mW1td3z4QFbPvrDImonWhan7yf2u4/HwwD9S4fQ9itKDg4GNXdb6KLkuE
	JL43RqUjc2xPFX3JN5FPK3TPbWF7MuYJPOjfTPdLms+nl+iXYarjn232BcLLneW1
	w0EophedY0Ez1cL0liSQ2Rr13KMs7oZVuISfe78zVDr77Flo45ltSmfShofKSYLj
	BXwLJ+l3EZaaRw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47h73k0kn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 15:03:43 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55QDlF0s003980;
	Thu, 26 Jun 2025 15:03:42 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e99ky8vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 15:03:42 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55QF3feE32244418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 15:03:41 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2A6358059;
	Thu, 26 Jun 2025 15:03:41 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E7585805D;
	Thu, 26 Jun 2025 15:03:41 +0000 (GMT)
Received: from d.ibm.com (unknown [9.61.42.102])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 26 Jun 2025 15:03:41 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: tools@kernel.org, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: b4 send --resend broken by 8cae1088cf605a12ed3207e7743fadcfa95c252a
Date: Thu, 26 Jun 2025 10:03:40 -0500
Message-ID: <87sejmk0j7.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sbWIhiFSYFaaET75AR9h-Vw3JAlatyOd
X-Proofpoint-GUID: sbWIhiFSYFaaET75AR9h-Vw3JAlatyOd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyNSBTYWx0ZWRfXxxhiP9yI0nyK ose/B9a6Osyi5UoVWeqdxZ9Mrtasu6kAPW6rEVbg0DlETQ+ko2JyrfkdsDWGkZsdC7L7cOPlADP rFwFfftq0U2dhCIR40zAsHuwomdY33ckihg0Pgqg/Jyjr9I0RCubIRqAJk86TBuS+Z+Y6OQsuBB
 /ExDWTyOgC39ycnaHh31U75R0vqLgAzz1XFUA7/AtRj+nycdchfkdC+CkmulkuYIr4KWmKEuldG BjQXm+oKm5N1SvRK1KnXB/MVVi6xAW16foqnJRToLfRLxewemO1ASNTHR3yDl8Z9uP+Rp0S9i5k pYAnxcy3fw77X8PLqAbmTmBnU6p8w2mbJXJ9ShNIe4AFRdKuAv0E9CjUMZp+iPxBvY/IPca7cK4
 bRkwniFohgLCPgFE5TRUOGf4PcalcRlnAd5sTKxXoA9n5M2ZaAix2cRWE85vc6j9Op/Mkko9
X-Authority-Analysis: v=2.4 cv=Aovu3P9P c=1 sm=1 tr=0 ts=685d614f cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=6IFa9wvqVegA:10 a=ag1SF4gXAAAA:8 a=2V6DY6BgAAAA:8 a=g9jXEg_Z-qJVdjQipFgA:9 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=ldqKKs2zR4t-S6fqr-1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260125

commit 8cae1088cf605a12ed3207e7743fadcfa95c252a
Author: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date:   Mon Jun 9 17:09:43 2025 -0400

    Further mypy typing enhancements
    
    Continued work to get ourselves to mypy strict clean runs. This mostly
    focuses on ez.py, but also tweaks a few other files where typing info
    was incorrect.
    
    Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

seems to have broken "b4 send --resend", which fails with

    CRITICAL: This is not a prep-managed branch or it was created by someone else.

The commit added a check for tag_msg after the else handling resend in cmd_send():

@@ -1802,12 +1873,16 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
 
         logger.info('Converted the branch to %s messages', len(patches))
 
+    if tag_msg is None:
+        logger.critical('CRITICAL: unable to get tag_msg from %s', mybranch)
+        sys.exit(1)
+

tag_msg isn't set in the resend path, so resend now fails.

-Dave
