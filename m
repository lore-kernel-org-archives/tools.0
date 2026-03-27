Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527BE331A63
	for <tools@linux.kernel.org>; Fri, 27 Mar 2026 15:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624940; cv=pass; b=leKY16VUTcJj1thLqDTWf9yrVYkM3pgbarZ7P26CQUWfIsZQiuiE8g+VdS32Y3Pa5wzyVb7KAkrY3kDIrsRWihm2GbYH9/CAq+fQDTO6owlX1aoO/LyiIyHgbnXtz5p2btr0VZaxNYq0hVTqLGPlJx7BU/YOEYcerAEfohb1Vgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624940; c=relaxed/simple;
	bh=nSAIPS8apZb83GQuzqTSkZBAknw30bY5ftimJrc7euU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=IahJCwhsifHUZN4U3N4VYZbVm5diGUkEcytw8wcHVfCcGi8uhQpfCVVgO5aBj2aCF1Tqyov9C0izysTAXqlks4mBNAQQcXYyN6txC9YZ5/eImQDzcdsjd7bf/jXzeV/3rdADnSYfQ9Z1Hx7UAWJRqA2coi+1bm6/WaKhAsP4U8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGfM3OK4; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGfM3OK4"
Received: by smtp.kernel.org (Postfix)
	id 2E576C2BCB0; Fri, 27 Mar 2026 15:22:20 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C889C19423
	for <tools@kernel.org>; Fri, 27 Mar 2026 15:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6C889C19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bd801b40dbso192715eec.0
        for <tools@kernel.org>; Fri, 27 Mar 2026 08:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774624938; cv=none;
        d=google.com; s=arc-20240605;
        b=Wp7PH9LiA8F/IocDHKdmlrFpjDNFPownSnn7S7NsvB8MEdgAONNomWWh4Qptq69LRI
         GeQrFnwiv67EUr2N3rbiEUDj66/5mab/PjKs3DAUp6V7HbDMYBlz1riN+7/S88d762lC
         zX8W5CKjHSDh3l4ammVP1OxP9YNWxFAZH9mx+ce30XbwkNjasIPeeIKHLtuTkKIRcLG7
         hSGVbge6094Fk55t8G87Zai6mpTXlbxDjmPbPZfsh0p2+KsKd9wy4tTLwALd303ThxAA
         DsB1cjd+WreRNr1vU4ml3+Zm5bCGPBKvh2BpBXDRJWoHVBUjGzqLjyhX8DsMnv8r+/rD
         C8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZJ6gmOMPdmR1Zk3pvtjPCK79k0T/msqhmIT6FIEVCAw=;
        fh=alYke2Tss2mTAqd4PmrBsruOembHBG3Fn+zBT9XAAas=;
        b=QlCdoxHzs+MJDQDmluki1LCFM4vp4bfmR5FATsvvtTTIsrDF9+0ZrjeRYH+kBD1sR4
         cRKw4n2Ii5BkzhA1YxjEsRThx1sKkOzuU3ZnlNFrBQItvD6+QVptYH/d45qIQukTTJUg
         kzR3Aa/qPx/nl2PVdcG6gyOnzeX859G+ds14+YQA/9dI0Li0BsKp25HETENAkyP0azJg
         w7Jx6EsTEmGqzvKQXMotlp+qlR+bByDoxREq8Fp/+Pp8UGAtArNu7Q+2nsxj846n9hFo
         uYG5Mgnp7bVtJyWOHj5kRNZ1FPnJaNGYlWBuRigCBbMfkrkSzRqtPr0ichXd+ZngobFd
         IzKw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774624938; x=1775229738; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZJ6gmOMPdmR1Zk3pvtjPCK79k0T/msqhmIT6FIEVCAw=;
        b=FGfM3OK4sbNkhq6AdZDGT961mHdgmRtrHawFUlJum82ceZWknIH4A+6gQaacRu9ksL
         X/C0q3DEzd6VAUaKwwqmvAWhbwtyQ+Eu4cArzfATmuJbghzu5gctQBs4y/7Hwpms7XyO
         wcjRFbQoHKspaWnsyaJ5BZO4q5FgXb2Ou9ueeA2cWVe8WeXQsJBMZXaOuw8ZHs3AB7L5
         Q+g02aGCQN6m0HgygSObrsZjolnSop04g6vCSVBOfMn2LxBBte3lhP6SoR+aaH/MncV0
         31K5GZdXjwMT02BnTQFRhpW7vGH31RUvI/pHuANv0ug58rc+TOt/B5EWx3fWIcOZqfE8
         yVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624938; x=1775229738;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJ6gmOMPdmR1Zk3pvtjPCK79k0T/msqhmIT6FIEVCAw=;
        b=BSMkgZx+KDmb95W1BMkwR3V2ZQAqe7uckozq8WCRUtJFwLIRho6M3MUixn57bFd10b
         HZfEf8YeecRx21dJ7yJmGlQYNps7o3oUxl+finAZ3voPbfD8HFFCn1LV4Vt78Mx5qzlG
         qKX7eqC69JaW5Qeg2zsHSPTOE43+EsuuEqr0WEXGkZlryGyDmANz2m06GcktlCLOuhh4
         YL8uuuO7MCkghwGz6n694aAUHzd/WBUdRI917MrOnHoL3u1mlppjVUWLCSKz7BN34688
         mugQlP1qq6fOdRnIctABt/T4oQ5bGn6loAU9fJ0l8U++q6vx1hTX/3bsX1OJVnaC2mAh
         gKWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4SZaCpm8NXqi02jk38NgqLLYK7PH7I4n0c6Yl/qxkgP1uZcdMA0v5PW2Pd5VqSLYxcCzaxA==@kernel.org
X-Gm-Message-State: AOJu0Yw/3Fymc5g+Hh9YbtgtiiNj/iPzWR+lthGMIAL7dw8hWngXX+Hh
	xJd9bjqSL2lNQiCcSFFP+WzIMwpBB68e5m/RMch4zEkdEzpk5ouN/FapFVzQBmuNn9Q9gdThHJd
	i5v/1IZjMVGocY3tMeK79zCW1HjfcLeQ=
X-Gm-Gg: ATEYQzytU/3267e/Yf+mgS2o+rQMHXvjrjjjjbczRXBJ6YRxBLWLuksb9Uo1X5pHnFL
	a3zc4l2lFLvYihnyQXq4AdKwJfN07xOs69G2mY5KIfx1wsuu+wEZ8UMNeH0Wcka+CBi1YvP1x7L
	cQpxcAsBUvh+hP2jzbtrwXhVdCdnrDdDbjbggm30qY4AoxsKCi5pQNmbwutnpql13M7bt4txf9K
	i32a/CgqVabhVnJO6dbF8dy/keFL2GEoqA2ypiFGbJV2Fdr9Na2SYdcKvHTICA8FBKoBoGrJCft
	umJYLG+N5HYYHiFSwfcXRX9ARc2/4yFCU2nasReRzlC0sC6h10P24ozyBxzuHumWAJrjnHS0ZWK
	7G+owk7Mo15ecLy+HhrO8WO8=
X-Received: by 2002:a05:7300:fb8b:b0:2c1:27c:758c with SMTP id
 5a478bee46e88-2c185fff821mr708632eec.8.1774624938374; Fri, 27 Mar 2026
 08:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 16:22:03 +0100
X-Gm-Features: AQROBzAh21DRrQQsQeKcbi9aLyKbHYrrabCqvW3kkPSUNLY0_I40G8OyQFFAYw0
Message-ID: <CANiq72kPiVvPrk9XjLv4QdBhtiPyGkjONu7BijF2mYdv4BM2Tg@mail.gmail.com>
Subject: `b4 prep` "not a prep-managed branch" error with changed Git email
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Igor Korotin <igor.korotin.linux@gmail.com>, tools@kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin, tools,

Igor (in Cc) contacted me since he was having a blocking issue with
`b4 prep` to send a v2 of a patch series. He was consistently getting
the following error:

  CRITICAL: This is not a prep-managed branch.

I don't use the `prep` subcommand myself, but I tried it and couldn't
reproduce it, so I suggested contacting you with a reproducer, and in
order to do so, I suggested getting the Git log `--fuller` of the
branch. Then I noticed he had a different committer than the
Signed-off-by -- I recalled he was changing his email recently in
another patch to `MAINTAINERS`.

And, indeed, if I changed my Git `user.email` I could reproduce the
issue. In Igor's side, the actual trigger was that for v2 of that
patch series he was adding an entry to the `.mailmap`, i.e. the
effective Git user email that appears in `git log` is what counts.

Is it intended? If so, could perhaps `b4` suggest that may be the
cause in the error message? (or even check that is indeed the issue)

I hope this helps, and thanks!

Cheers,
Miguel
