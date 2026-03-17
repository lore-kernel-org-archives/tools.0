Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6784A3E3C7C
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 15:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759718; cv=pass; b=FiVJfz1b3SRn8CIQltgIZ1LZqkxFecF4IInenK5nOzFJCbCo2ZRHeOH942GugVy1zrnklFlixGZuTrP7fV3Fe4OmLHzX1YemT9nr1cobe32K/g08LA/HMF9DsJh2rZb1lXxwGLilqAuf+QGJSjesR66Tkw1lrCdno2RaXxGCmCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759718; c=relaxed/simple;
	bh=9DYGv1zsWb7eo2NtLvGlKOZq15b80ahZhKLYQHJvuiA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mCC80hdknFVsd2I8PZ/YO6fNmXQ1juQT+sWLsHX+5x6CTNk39J9/RHbXddy8Dr41t+Bk28IEYdDD+Nne0iJzUXLjedfzp8/VYkFbHCSgvBMpgfrv63oCzTOvqatEaKrtJltrnTCMRegO+UJ/Ibpq2oEo+swNkw184QLd9BdPEdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYsFDDVK; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYsFDDVK"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89c55a0a470so23191096d6.0
        for <tools@linux.kernel.org>; Tue, 17 Mar 2026 08:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773759716; cv=none;
        d=google.com; s=arc-20240605;
        b=RWleWCQpueHIETwrwbIrQBimbe2elKWUyZnUvQ7UboBZbdeJhpQjnzqbvCXS+VIejH
         K5df/WFr4UTGt1XD0uVBG3wAb6lgTWrvjlueZb3m0/t9EU0VlycxOJQRbeVL6xMvaXzO
         JOdN7i/eDY43iP1gziBFmNh3QWC1soviOsgesWDQz3nufYA+r+gMJZBHb61bBnuj4ja+
         gfjmJpsPJN0yG5LDu/4n1rxKd5N52LezIdzO8imKfdUJ5oea8FWExFFe6LGUUI4ubuDf
         SP7jBz+BbzePjAfGhmVBT6v1vsBoW3b7QBXYugSARkc0nsBVp82tVCiLadmHDoTQEJw2
         islA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=VkzVCcvD/qs9pvPpPx/vOich+3UZQN8LIBihoRdiGo4=;
        fh=SLFtMA0WcE3eL6H/oV585MPjyT/DYEA5cb8AIsdKCLY=;
        b=Za/do7+DYnI2VHUlXuSEHE/fqBqGPZNjIFjiBUSY8RjL/6HzeWGviRhUvrh+k7Sj62
         HCtAFYcAuLzK2RaH97huE3aSiIbXos9z2g4w+qHmkvKXUkoKpDW20/FUBRwngJ4I1/u/
         Ca9Wok9YHeI48SioqTzXTVh4+w3oBrlyQyh63DOpQOfQS5UhJvxbjkPt9cNTp5/F+7RI
         +BfZkQZgbC9ysvjbIzVzyWqoOhblNl/wzP1A/Vtcvha82EKsG2/YrWyZGnWHZkxTLo7I
         9IDRCXdQS27tIpIYq0W0Nh6cbzB3SAEKV7qrkWZXtYX/AsXW9tP5Nb0PkctXyzTTCNi5
         54gw==;
        darn=linux.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773759716; x=1774364516; darn=linux.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VkzVCcvD/qs9pvPpPx/vOich+3UZQN8LIBihoRdiGo4=;
        b=CYsFDDVK6skqDZ1/6edJiKfGWcSMjymvckky5oCux1QzuGSAhZmMaOdvDol9XtRJWM
         FMEzNGp/OH5v6kx0ehB3ruKpgrblCAPhqS1495RAn4BVCzpVZaYO4h3h8VaELOdcMyfV
         d9VRpjt57ailMLR0KAf0LmBvO8NrPOYu0qd7qBwAxUNZ7CpdIBz3109tDmTYWRe6bYFQ
         2IS5ZNnS6v0nMmvXKedcioo2HIDGD2vJRNSgP9I5fD29kg6mVyn4vxPgfttUy4Ngo8tO
         JRQTOka6D28FagMUrlLIKsFOZ+PmEnNa4Ce4h6+i2BjQYQ8Jtl+/E2oOgxirpP7YX5Yq
         +ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773759716; x=1774364516;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkzVCcvD/qs9pvPpPx/vOich+3UZQN8LIBihoRdiGo4=;
        b=h7dA4jgBfi2kGazIScc7Ina0zG6dIFruYTn8SNhRs+/lp8Sg7M4fzf4NVpKtp9OrCD
         u0d8sTkbbvVHmFypHWRz9QujHIF1At+l+mT2H+aRpHeBM1An2PtLxUUQOS2Z4D11/k+7
         6CLojRnosmgFcs6GmsTN2LcSh14+lU7sMYSTW/LgjzTqT94kjGYCzD6Y6agkrQR9Ps/X
         PlPE2gnRGPogn8gOqiLDQugqz8cor1Ia/asFQuOG5X+bbyAKySP8ZVP0w3QF09KGmph0
         7Vd4GsfBOxPW/mNqoVcBBeh8A4i+gGxZ60XxVAixy193yaTgCNs33tB/IF3yPsS5tUF5
         9QOA==
X-Forwarded-Encrypted: i=1; AJvYcCW6GvQ6FDlBEi3a4//tee8zfAbAsSEHkKqM2oaMNNWbI5As3NRqdZRf6TyT6NGCrECDvdYJ0g==@linux.kernel.org
X-Gm-Message-State: AOJu0Yymanpp18W5PVLAHbMxngAfGuF713/ItUjZyRxLvU9IqzcBJzyU
	tAXMYXWpKG1/0lLvXF8a/IEh+o+c50X0mYCMYXS6q8AtNLbzmePwnt4GWOyJPPCg7xhvEbPie9r
	wbHTsJ61vmd8Os9ypcu8R8/NHNT1rheo=
X-Gm-Gg: ATEYQzxeW5B4tiBTtthsbKLprIzYBiJZYMXr1DCznPJRVIA2ojLcNjYeT3H3zFlPtJ7
	4w7TduDjISIHaSbQEoJiGdVo4jnSLPkt9Y5/8fsWgoFtcYC9rJrygiEsGrsRaWFHkHlNCAxtFTo
	uEQeueVoXgJrXD4kY/krLLwWKX9Vxx82t235r+99Eg7S8LcBMgy+Es9Z0gObqjnikc+WN4DzS30
	Yd5mLnS1BDT8OgGOL6/s+MhY3ftjO2t4I6OAdtpNT0WIIN8737ZW2dA7zPw5rMybJmJCM1LPAhV
	NCcF2nrD3+STZgEjzTQ8hJ4ogWFCZNvgf82wSMsdqt764TlhZGBIauz0uiyrIkI=
X-Received: by 2002:a05:6214:dca:b0:89c:5f6e:451a with SMTP id
 6a1803df08f44-89c5f6e467dmr43920376d6.21.1773759715546; Tue, 17 Mar 2026
 08:01:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Chuck Lever <chucklever@gmail.com>
Date: Tue, 17 Mar 2026 11:01:44 -0400
X-Gm-Features: AaiRm53_7a12sXGyddYsrdXqXsyy5c35m7Tuk2IJeTJ8b44ByBrieulVLpFFH20
Message-ID: <CAFMMQGt-Dc4DiSNUYR1mQfUBswP9bmjyXfcvuy6HO57rZ79fHA@mail.gmail.com>
Subject: Using "b4 prep" with Stacked Git
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin -

I'm a long-time Stacked Git and b4 user and I'm hunting for a tool to
juggle the many data items involved with posting kernel patch series
for review. "b4 prep" seems to fit that bill but it has some issues
when it comes to large cover letters with Stacked Git.

The branch-description strategy is the least-bad option for StGit
right now, but it's fighting git's design -- git config was never
meant to hold multi-paragraph prose, and there's no way to tell StGit
"don't print the branch description in stg branch --list."

A file-based strategy would solve all three problems cleanly. Something like:

.git/b4-cover/<branchname>/subject
.git/b4-cover/<branchname>/body
.git/b4-cover/<branchname>/changelog
.git/b4-cover/<branchname>/recipients

Or b4 could use a single file with delimiters or structured with JSON.

Advantages over the existing branch-description strategy:
- Each piece is a plain text file, editable with $EDITOR directly
- stg branch --list output stays clean
- Changelog and recipients are structurally separated from the cover
body, so --auto-to-cc can write to recipients without risking
corruption of the larger prose items
- Trivial to version-control the cover letters separately if desired

The tracking metadata (change-id, revision, base-branch) could stay in
b4-tracking in git config -- that data is small and
machine-manageable. The cover-strategy mechanism already exists, so
adding a new file or work-tree-file strategy would slot in naturally.

I'm asking before prototyping to see if you've already considered this
idea, might have another idea, or might have something already in the
works.

-- 
Chuck Lever
