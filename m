Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393CF3A9630
	for <tools@linux.kernel.org>; Fri, 20 Mar 2026 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017708; cv=none; b=tshVuwDgZgGBeIkuMvzfZ0INOBtZl/jHpJvzy2ceUAoow4Y+dk+Wb88qT9ydq/cQme5OgqsRsaYfOgKayAJkB3vmH+01w99TDhiQ41J7fKixRxvyzAusTRNV0K13VIOs/X/x1SzvOxRAPuXmmK9c1qM+M/MezsWWDJYwdwMjFfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017708; c=relaxed/simple;
	bh=uFjQzE0Agf5IuAl0JI93M/b5KunEcIyz9qckG/pYpA0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Mww6rTPNtXU/cencyDVSxq/Vj/nyfx+GAehRWeGRwxxGRnsxtCutjb9y9M2MCfYjbkxFcoRvXsZgBfmF5axTchTausWxHNJGca056FRSIR3Od31Sm0nFCUxg8VKSBXcjDnwRrFaOGX+E83N21IkRS6wD+PkyHCzrR08rc86U5BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=h54k0RIK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="h54k0RIK"
Received: by smtp.kernel.org (Postfix)
	id DB09BC4CEF7; Fri, 20 Mar 2026 14:41:47 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0330FC2BCAF
	for <tools@kernel.org>; Fri, 20 Mar 2026 14:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0330FC2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K53nS5700502
	for <tools@kernel.org>; Fri, 20 Mar 2026 14:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	pp1; bh=9VBgpD3UrZjnhwhVpUYjxipayz/Ar477SdxtknjZajo=; b=h54k0RIK
	2bZJy5RG5/78YF2niPjRgI2Rd5l2XDNHsJFK7z4gGd1+s0qSWBTl+39Md7csR4zO
	aLAB0f79agqzvBHvOT6sDSCjO6DFwJShSjcVy1UodYNs8BQRFEO0SV/WjEQbN0DL
	frhiuslsMYNtQhksGa4YoL8r5bfev4heK6VsrOzgAtCpN18PLlhDw1ZTiOw1ovj7
	HUfaXF1Bhyq79/24SF6HtE4hdtvHftOT6Gmd+sLGSlOuw3onzP+VIdgamJ3CCuOg
	tCs52Jn/Pd1nUw3SHvfi7clF36R3hfqe628XX15OHlrkmRa5cNZZ4SdPhZ5WOiK4
	DTMik4UH6XACwg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cvw3jb8g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <tools@kernel.org>; Fri, 20 Mar 2026 14:41:45 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62KBj5gV015662
	for <tools@kernel.org>; Fri, 20 Mar 2026 14:41:45 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cwk0nqj0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <tools@kernel.org>; Fri, 20 Mar 2026 14:41:45 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62KEfiVp15073984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <tools@kernel.org>; Fri, 20 Mar 2026 14:41:44 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CBA95805A
	for <tools@kernel.org>; Fri, 20 Mar 2026 14:41:44 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5784658051
	for <tools@kernel.org>; Fri, 20 Mar 2026 14:41:44 +0000 (GMT)
Received: from d (unknown [9.61.7.108])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTPS
	for <tools@kernel.org>; Fri, 20 Mar 2026 14:41:44 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: tools@kernel.org
Subject: b4: prep --edit-cover emits strange message about "Already Ran"
Date: Fri, 20 Mar 2026 09:41:44 -0500
Message-ID: <87v7eqd0lz.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Xz1QnYrE5XqiH_ZxmKgAYt-Ml412yHRD
X-Proofpoint-ORIG-GUID: Xz1QnYrE5XqiH_ZxmKgAYt-Ml412yHRD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExMyBTYWx0ZWRfXyNmeQpOZb4UU
 5fZIx1pL/I7PNQB6SI4AW+iAbO6xds7LOeYqxNxSTLAaRLGibl8ZbDNVXCA4rl+A5jglAhdv2zR
 BL5YeEe0KSJob3FuP7YTPpllE9MQ48gzKuEQQuxIykE6usZ8LBBoBOdgv0sdTo0rKZLaEFpilWh
 JXNB/Ke8OqUjFmAib/cSXpaJIoBBGOugUDvdiO4J/KmZfijLU8/JJHjcNrCAdsPEEOMEv7l6oRB
 iWM2xnAISuwiUuXFXbMLdjxbjQUew/pnWkwhehOCVOy3H6FUL0LwT0KldNMSHhKa7tcbQNqFgeX
 mokqZTLqkmb76yN2F9oikQ88iV9HCZmDU9j9V0P7q4UvOJllCWXFPvc5V+4VccQC2Qb6vwytqWE
 a+2ZEL+wLEBEIWHeJYMLPb/NuTc4xL4prafJveu63x6lNSApGVsrzObQ28GNJ4Q/+9WraAJa+Kk
 /3tNVehRAmIPwamWSqg==
X-Authority-Analysis: v=2.4 cv=Hf8ZjyE8 c=1 sm=1 tr=0 ts=69bd5ca9 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=zYvUCxAv7kivcvwUqrMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200113

I found the message here a little confusing, and had to go code
spelunking to figure out what it might mean and how I should answer the
Y/N question.

    $ b4 prep --edit-cover
    Waiting for Emacs...
    Invoking git-filter-repo to update the cover letter.
    The previous run is older than a day (/home/davemarq/linux/linux/.git/worktrees/ibmvfc-fpin-bis/filter-repo/already_ran already exists).
    See "Already Ran" section in the manual for more information.
    Treat this run as a continuation of filtering in the previous run (Y/N)? n
    New history written in 612.22 seconds...
    Completely finished after 612.53 seconds.
    Cover letter updated.

I first searched the b4 manual, and found nothing about "Already Ran".
Eventually, on reading the b4 code in ez.py, I found this was from the
git-filter-repo package and I should check its manual. I found the code.
There's no way to opt out of this check and message.

Would you be interested in updating the b4 manual with a note about
this? I eventually figured out I should answer with N. Perhaps an update
to the --edit-cover text in "Prep command flags" in the manual? I'll
provide it if you're interested.

-Dave
