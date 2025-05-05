Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FD6274667
	for <tools@linux.kernel.org>; Mon,  5 May 2025 21:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481351; cv=none; b=aVdB/4dvMDob6Xdz+Qe6JqwA9UYQ32psWXXVy42pT9TQ/K3wpycpaEwJsvX5e+tMU+MMrX/EsY9tS6KiaaaCcHsyRVWvZn0HxVkE7Tmp69xYMFksBhPqTHke6Jqxg/N4x4fZNJtrnhSa2o7+3xwaH4C3Ote8jALdGKB5IMQIhmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481351; c=relaxed/simple;
	bh=QkBHD92B5u7g0UOkXfJWraWt1Mwu0yAYjakFduSjLyw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=FQ+N2D8+98j8L23YIAuZVIQdToaCL3+T7JdMvyvExN2p+RZxE7h+Zi3Azsqhu5V9Alj05sdbJ5oB1X3wbWTLsx7zMsytFBJfVGarQpOe4bEv+JmAa7JCMBETRdIb7ztnZbkkx5fwEBd1SeRSHWzzk7Qvz0KX5A853+LJ2DyCFjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dya0B5Ff; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dya0B5Ff"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso818454666b.3
        for <tools@linux.kernel.org>; Mon, 05 May 2025 14:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746481348; x=1747086148; darn=linux.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5wN5OFxbpB+pkZzbPwhr2dzosa086JRnceJ00sLIJRA=;
        b=Dya0B5Ff0kh1bIb4JZbeQ+4jKGXViCdlclYCmEbghi8TDJytm9tKWUHzUic5zflroS
         yn6frAgrM2j5/dKP5Ho9Ri27LUzCk7wTiK3wpPmw82tMm77BPfWLurODvqtbjac+hMMB
         LDyAfAeQ9ZQgzcJ6Vhjbaq38prCg1h3MU9/CIqDOAcFg7sMQAQNEMTWHeKQcGQMAq6I/
         eewSiD/8GgXxkikbQ85ycJjNwz6zp3KNQoaB7U8fTUSUwDsIWPTxJjMD4B33B4vWjuFC
         2mfKta8/UOSve+ozMcneq8xVllWE5opvMpfN2PnBhCAn/C+Y/Lb4TaOZTzg45QkQRj9u
         JL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481348; x=1747086148;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wN5OFxbpB+pkZzbPwhr2dzosa086JRnceJ00sLIJRA=;
        b=nLyOhXCHAc/SgYTSwy1Bkp40VD2p2Esm5P6TnzKfAqY0nz7c+RBOBDnkiQBgQEoeFA
         9HW9ZgoTuao4slFLIYLiWoGafgJj8tBZzZYk8fJ57Wy8NzdCyat0xit2g0eUmcZn14fP
         NBnau+8EKSlmOp/8ZjSf+ymAtY4WZYWy/LFBpX6wCiR/s52CX96RIzhqFLT78mPrMfb1
         hp/RgUH056SLegsJahzuyRvftvxj2B+iB68CNCZjqNQAAV2l+9UGD77D0sqiy9yISf8M
         q9fRr0WvmcFL2txoNxP6mJskaSkSjfELTkVEwWpuIF0XQhTA+2OMKLXNJu5bLGNaa5IO
         O/WA==
X-Gm-Message-State: AOJu0Yx/JKuc4jVvnA84P4cd8GVmh5CqZbF0A1Liu9XHOCPG145PI05+
	9baG1fO0dIwPCor7smq/bkCa9wHA3yj+XEwq5vO1+mK344lpkUw//ZpGMmH4bV77EN3O8RbiXRd
	QmtppvHh3XolExyv9+/fspVlwRcp8Ukozfw==
X-Gm-Gg: ASbGncsbJbBN2BlpHzNnk+i5TzBn85eG9BdyQYnBEuN9o6z1O/NBcVtE5H499k22PJv
	mLvbyUdMwifrFGSu1qRa3xhVNXqHf9HqQ1NUBmRXy2x14WMUqwUV1UQ0inEzQ6TWcao9qhRTC+E
	zRPPfezS9Nrtfm3eHwbu/UxXqTsFs7PbAoLJSxI12UK8JMTos1bt64W0M=
X-Google-Smtp-Source: AGHT+IGFpRtUApDhEGigFXHq9otpwKpNIbnevhXKpfJq27P5PxB95FCodwauTB9nM9tMBQH4A9EZD2LUVtPlja6PIqU=
X-Received: by 2002:a17:907:8b93:b0:ac7:150b:57b2 with SMTP id
 a640c23a62f3a-ad1d4692427mr54862866b.41.1746481347645; Mon, 05 May 2025
 14:42:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robherring2@gmail.com>
Date: Mon, 5 May 2025 16:42:16 -0500
X-Gm-Features: ATxdqUGUOK5xEHaF-dUOYdVcxGkQGNPq_NzrOCXT6I0_A9ZnUNMoSxObgUQIegQ
Message-ID: <CAL_JsqJJBZL1w-HLwr9nL4Zh50KnwOFHCE_m_hcvwnkVPH-S=w@mail.gmail.com>
Subject: b4 cherry-pick behavior
To: "Kernel.org Tools" <tools@linux.kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've found that using -P_ and -P<n> have different behavior. The
former will not pick up any trailers from the cover letter while the
latter will. If that's desired behavior, can we make '-t' override
that or something? In my workflow when reading a thread, I have the
message-id readily available, but not the patch number unless I add
some parsing of the subject.

Here's an example. Note the "Analyzing ... messages" counts.

$ b4 am -P_ 20250423-dt-memory-region-v2-v2-3-2fbd6ebd3c88@kernel.org
Grabbing thread from
lore.kernel.org/all/20250423-dt-memory-region-v2-v2-3-2fbd6ebd3c88@kernel.o=
rg/t.mbox.gz
Analyzing 1 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 18 code-review messages
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH v2 3/4] devres: Export devm_ioremap_resource_wc()
    =E2=9C=93 Signed: DKIM/kernel.org
---
Total patches: 1 (cherrypicked:
<20250423-dt-memory-region-v2-v2-3-2fbd6ebd3c88@kernel.org>)
---
 Link: https://lore.kernel.org/r/20250423-dt-memory-region-v2-v2-3-2fbd6ebd=
3c88@kernel.org
 Base: not specified
       git am ./v2_20250423_robh_devres_export_devm_ioremap_resource_wc.mbx

$ b4 am -P3 20250423-dt-memory-region-v2-v2-3-2fbd6ebd3c88@kernel.org
Analyzing 15 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 4 code-review messages
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH v2 3/4] devres: Export devm_ioremap_resource_wc()
    + Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com> (=E2=9C=93
DKIM/foss.st.com)
    + Tested-by: Tanmay Shah <tanmay.shah@amd.com> (=E2=9C=93 DKIM/amd.com)
  ---
  =E2=9C=93 Signed: DKIM/kernel.org
---
Total patches: 1 (cherrypicked: 3)
---
Cover: ./v2_20250423_robh_of_common_memory_region_parsing.cover
 Link: https://lore.kernel.org/r/20250423-dt-memory-region-v2-v2-0-2fbd6ebd=
3c88@kernel.org
 Base: using specified base-commit 0af2f6be1b4281385b618cb86ad946eded089ac8
       git checkout -b v2_20250423_robh_kernel_org
0af2f6be1b4281385b618cb86ad946eded089ac8
       git am ./v2_20250423_robh_of_common_memory_region_parsing.mbx
