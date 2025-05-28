Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BB81F790F
	for <tools@linux.kernel.org>; Wed, 28 May 2025 06:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748412937; cv=none; b=Bnebcr45Yo5MCE1X9zo/Pk9/PuDmuqm8A2b9rBOdF8Waxv9dFjH5AEF2aYs7SKlpl1EgqblNZRbcqLiMmcXkmU433D6Ze89JhmORi352orTREWZEjvrRa2QK0kJ2zZD0+wk+y0273gwdj/XAX1Eu/tusaF9RUhoqNdk8KnoWvpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748412937; c=relaxed/simple;
	bh=ft0bjiO6z4qAZBaZwTq8yzmRSlh4Dpb92+t0InWehbQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qnitY4CYZHlQlQskNQqlE1yE8gNZT1e/8+3fH874PVwoxGLmlV+TFPska/g9Qkq+A/otvOcAtdGbsejxjSTEIK8SZPSN0S4o6WdYENm7MQwZB49+dRS1zkVyLwiefflS6dw+Um4wDdgPGeYHWG5h4Xq/smbu8BVyZol2R0gsdMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=oHuPvAVO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="oHuPvAVO"
Received: by smtp.kernel.org (Postfix)
	id 66377C4CEEB; Wed, 28 May 2025 06:15:37 +0000 (UTC)
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91CFDC4CEE7
	for <tools@kernel.org>; Wed, 28 May 2025 06:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 91CFDC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S0UaG8009222
	for <tools@kernel.org>; Wed, 28 May 2025 02:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc : content-type :
 date : from : message-id : mime-version : subject : to; s=pps01;
 bh=ft0bjiO6z4qAZBaZwTq8yzmRSlh4Dpb92+t0InWehbQ=;
 b=oHuPvAVO9Gi/jU/3BNVueaOta5XTRgVXE0sVKgys+eSrstY+ZMv0Ikf3D/ImN0eL6l8y
 o/5oFq7hvmpOewmzkdcM53LfTvUmWn5YCBF5HoZznqHATdWItcYbD/uvYAEc30Jk//yi
 O6aoE/B09qVQPqFitqrQXEIz3bpHLwtJqlNV/+/vwgspYW5Kv7ZQqZeLCPJuSl+u5Dlz
 kxGCAosLy7AnewlYRITvUM4nH6j8XdDc/KSOBtH4/vV1jlyDdYf2mK04UlcgyKqGadYT
 m15njy1yl/undVjsdGy0Ysnx4ziKn7EydeegtMLuwiZeQv102U+4wxd00ZG4uTmiU700 Fw== 
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com [209.85.219.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 46u8d1rh7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <tools@kernel.org>; Wed, 28 May 2025 02:15:28 -0400
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e741f4a7585so4852618276.0
        for <tools@kernel.org>; Tue, 27 May 2025 23:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748412927; x=1749017727;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ft0bjiO6z4qAZBaZwTq8yzmRSlh4Dpb92+t0InWehbQ=;
        b=qi7CSJ7VF5ljGvjmeAXI0ABcXSYmmhiwmsSTCn85k6eFSOqWXodIZrJL81voocYuxY
         npmPyer4Yat35ICa8IrUoGwLhlOR+YM14mpsR5uRzmIU6/cLDHpGEr/xa8PI52PXC/j9
         g0Q7palNHzEAUN7IwURzpmt8pFdU9hOguAlvvt7VxK0HkLCNVWOKwEBYDsFqyzsxUD43
         jBCTH7yHWk0JMhZs2Ahjcu7yx66ACIKVs1KMdv35vKI6FBOtkgdQScrAUhSnoAIPYesa
         lXYQymb5e3irrk1afLOIkNAUD71IrSOyimAKN+kGvJUEWOvWvcm02A9hiF+Nsl+zGCoD
         Fj5w==
X-Gm-Message-State: AOJu0YynpdKZz35bj7pxzwQXJC/YTJ8X4CmYaPsKLDIhlpDBiMwTi5Mb
	NtOVIe3+gSakOr4LT2xdP4dBGGVdZ2iy8KPRlboauI99w2X0OzjiBIvvXlkpBrLGZEsmwT6nru0
	CJQZyZKt1By+GEJDAYXL601NBdezuWdAp8iuLkqgCjUfb7s6Hoxs0N1o5onETP+cLwJLAqBauGm
	NltQOYcDZS0CrNTtkj4cSPhvleY0Q/7i8=
X-Gm-Gg: ASbGncvTUaz5cdTUqqwKXP5syNwg8dMXXGw7R2de+nu6DRlSOiAqgPsL7o1DwU8qfzS
	kh/b1f4y9/1N5XwTKntCjrq14ZVW+PeXXoMwsTsE3X072/Ap+2HKo1CCJ5YIr+lKH54mq
X-Received: by 2002:a05:6902:124b:b0:e7d:95fe:e85b with SMTP id 3f1490d57ef6-e7d95feeedfmr16309859276.12.1748412927500;
        Tue, 27 May 2025 23:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv7v/TCDdmTlQeWabSZmJ129EoDiMuXkrYilY1qS1LU/5SME/QEBwB7iyUOHV4KXexr4Lyo5VZ5UaMjbgFdtk=
X-Received: by 2002:a05:6902:124b:b0:e7d:95fe:e85b with SMTP id
 3f1490d57ef6-e7d95feeedfmr16309840276.12.1748412927088; Tue, 27 May 2025
 23:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 28 May 2025 02:15:16 -0400
X-Gm-Features: AX0GCFtiamPvECYX8rB4xX6c84GIpGQUaFEfbcOba1vQuscjo-I-iiJvsVweELk
Message-ID: <CAKha_sri+u=R9x1h9tg7N4cuTFckLmbe22=Sw2P2jpw_fm2Jcg@mail.gmail.com>
Subject: b4 broken with git older than 2.41
To: tools@kernel.org
Cc: Tal Zussman <tz2294@columbia.edu>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 6AUYsVGB67weM7IFyAtxplncF-qBy8dE
X-Proofpoint-GUID: 6AUYsVGB67weM7IFyAtxplncF-qBy8dE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA1MyBTYWx0ZWRfX4kHG2Ty2LWbW l11jJarxYgnRbnv34QB9OxzKtFTzaLVSbivn+mV7hqn63KEw2iaeUnXGRzzz0ci+QmqDjl8RZQ9 DVdP3gr4265dKmb3LiP+MQHarE6KL8LQfU7wPMJZDTy6Ra5YyF+0LnKqcvNCaYoc0c2LN0Xr4S5
 Ul1Ylb3XnaaXUM33eO/wpXrKDtH2PJ4OU2cyUM07MXDCPTROvBg+aMsDM0WY8bO2L2lLSNO2dvT +I+KchkfVVzLkdP0NugN1VVV9uvlY0Y+3Vci04+rwsYUAnhTSNyKtH6Y7ZcVYYmgR6NPPkuWXZD B3Go14u+v15REmRUdLY47x9fkl0Xc9K4R6jkAZi8go3nG3qjBxxKrVEk6kUrE6CYSAN4y5KSjgU e05UsgIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_03,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=10 priorityscore=1501 lowpriorityscore=10
 adultscore=0 mlxlogscore=667 clxscore=1011 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505280053

Hi,

I am using b4 (both master and 0.14.y) on Debian 12 with git 2.39.5
(the latest available).
Unfortunately, it is failing with errors such as:
"CRITICAL: Failed to convert range to patches: Could not get a patch
out of bfd12f86c8a48927959a7d88c84296823e15a8f9."

I narrowed this down to the use of the '--default-prefix' option in
git_range_to_patches(), which seems to have been added in git v2.41.
Once I commented that out, everything worked fine.
Is there a minimum supported git version listed somewhere?

Best,
Tal
