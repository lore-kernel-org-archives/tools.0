Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CAD2BDC1D
	for <tools@linux.kernel.org>; Fri, 18 Jul 2025 13:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752844495; cv=none; b=JQexLLEIybSZECQYT2XGdq0wSpLuoE/OqerJpEMv4wBKo052tQ1sXdrtpsfPuzBLDOo87a+5dsXZfbtFPlXvGlXFcP6TKlNy6MRhFpyIfhkjLPiVB27l77gXZLmMpPpNhu8KZ2Crdq3O53y+4aXlHyDquhBg3+lz539Tr6gtN1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752844495; c=relaxed/simple;
	bh=AkdL17Ng57w97RYYRZTL6YiU5+sT7wPxTHAhBtwMSN8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FU02LADEs7rGv0ElTV+2d5PjfTJz0X1PmZQR1dB+BYlCoi2NBt9QvWWqiVDExvRve4mjdi+dNRkmSXSDyv5C+4DIDbkmelGlRrAiTp1feh8rtJneyU+TZ1RI8VO3Ql9APU8dcQUHZbq2psPPCZTamau9zEi/SReY5fOwxcVWLww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=QhOCFhMm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="QhOCFhMm"
Received: by smtp.kernel.org (Postfix)
	id B6BF4C4CEF4; Fri, 18 Jul 2025 13:14:54 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CDBCBC4CEEB
	for <tools@kernel.org>; Fri, 18 Jul 2025 13:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CDBCBC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I5fI3p024089;
	Fri, 18 Jul 2025 13:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=upmTRcVjS/P3H8XRIVXeNQKladnO/6
	Yak93OYgm9xEE=; b=QhOCFhMm8ImO4D30xz1jkwsW0hvzWdMb3yDmnX0bqUi20k
	NWSBnuLLay2WRgjqsLG5BXEIdszbqZQHE+jHVxo2g7s3cQ6fOtyQ2d6gBI0HkjL2
	mP/Ho0WHesnCe0XZrN5FEA9qrUHxK/yZYNK6BcUqlR25Hnk3SgfBJmJ2DARXRI3I
	cl3rMDgyw3lSdmn2Ax7bCgT0P0CA5UbJMztj78IDAxeLMKcjCfbN0FJzym1tSy9C
	93KdTDbooUCITElbafTm6ljukktuuBX2lWRchUPzgh+OsSP1qfuGD+ip4tfJxm0J
	4D3YQNhimXLZMRi9t4Lw69iD9wT1JOmP1lEPEV1w==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47y07txpur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 13:14:46 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56I97fb3025505;
	Fri, 18 Jul 2025 13:14:45 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47v31q1cvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 13:14:45 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56IDEirA22020706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Jul 2025 13:14:45 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A76AF58050;
	Fri, 18 Jul 2025 13:14:44 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60F8058045;
	Fri, 18 Jul 2025 13:14:44 +0000 (GMT)
Received: from d.ibm.com (unknown [9.61.124.126])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 18 Jul 2025 13:14:44 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: "Kernel.org Tools" <tools@kernel.org>,
        Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>,
        kernel@pengutronix.de
Subject: Re: [PATCH b4] Fix broken fallback to user.email
In-Reply-To: <20250718-fromaddr-v1-1-8bc274dce855@pengutronix.de> (Jonas
	Rebmann's message of "Fri, 18 Jul 2025 14:04:04 +0200")
References: <20250718-fromaddr-v1-1-8bc274dce855@pengutronix.de>
Date: Fri, 18 Jul 2025 08:14:43 -0500
Message-ID: <87seittzcs.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YoUiUOvv1FvQRx6XtjM27Gj33wgtDgPT
X-Proofpoint-GUID: YoUiUOvv1FvQRx6XtjM27Gj33wgtDgPT
X-Authority-Analysis: v=2.4 cv=d/v1yQjE c=1 sm=1 tr=0 ts=687a48c6 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=DYDwxu0VhUgEOtonHugA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA5OCBTYWx0ZWRfXzzRoOEwoXBaq QrWjfTYYO313hC9ticIecfq+V6VEeicAJokk3hQmfWAkeL+zSlDoXZB4vtViPW/mXZOQYgMbbAI OFmpuQucdjWrcj2MXq7IuCm8hoeWIyVjPN6GItgkjQvMeob8asgvGsYayCiB0Uk8iH6rOAmsTBZ
 8kBatPnk8dfVJC/tu/QbhLggD5GLRZ0nW5cc1HPGF5XtKlhbqw37yPUZaLiDpZ6ByuXLziLlWW/ XsIaN9Q9wx+O/rJ7GoBcMZ/hIjnFnMuNu0UogQHr7vUPfppEAJJvjT4RrjE1Z51PsxXD1vjiaX2 pPc7h2rmbBU2GSwTFO1tHll8jSZZFiHV4W+WxYnowo24cWJEiVKG+F9tTQ9b5kREeJJzk7l5Qf+
 0GuOccUbPQaRYg/Do+OcXfINMSUgvslg3hoiMjH1H6mV9qgWwLkire61v+qH4ZZt2uLs29mc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=736
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180098

Jonas Rebmann <jre@pengutronix.de> writes:

> After conversion to string, fromaddr becomes "None" as a string literal,
> so the user.email fallback would never be reached if sendemail.from is
> unset, eventually leading to `smtplib.SMTPSenderRefused` (<None>: sender
> address must contain a domain').
>
> Convert to string after the check.
>
> Fixes: 742e017c1b ("Cleanup: initial round addressing typing issues reported by mypy")
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
>  src/b4/__init__.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> index ff6075e..c116344 100644
> --- a/src/b4/__init__.py
> +++ b/src/b4/__init__.py
> @@ -3949,8 +3949,10 @@ def get_sendemail_config() -> Dict[str, Optional[Union[str, List[str]]]]:
>  def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL, List[str], None], str]:
>      sconfig = get_sendemail_config()
>      # Limited support for smtp settings to begin with, but should cover the vast majority of cases
> -    fromaddr = str(sconfig.get('from'))
> -    if not fromaddr:
> +    fromaddr = sconfig.get('from')
> +    if fromaddr:
> +        fromaddr = str(fromaddr)
> +    else:
>          # We fall back to user.email
>          usercfg = get_user_config()
>          fromaddr = str(usercfg['email'])

Reviewed-by: davemarq@linux.ibm.com
