Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019563451A8
	for <tools@linux.kernel.org>; Wed, 20 Aug 2025 14:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701959; cv=none; b=KCjX3+6CNERQs8bNH880Fr7uV9resx2SXD6wyqrKYxoPrsE3YTZJAE8ARMFJu/FH75z1vixaPxkracllXTYVpHTXEaj5vOO6dQ8iWfatMS7dLbeSA42sNyM31oYW7QO8XLfI4DB9n3UQZKX9JnlGSmnmyidj+vFcorpY5VzqdOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701959; c=relaxed/simple;
	bh=nSjL547IQQQEU54ydHjvxbeK5RWiqc6aQZ/eqZkTdmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwtxa5tpYjC445/ah0ttYhK3uE+K1YBUltx4HoLxXZBJLwKGRWHAZ3k67jBM41mgWAb6nRUou32fgVCyZ1sXTLedjYTHHaNah2rfwOKjNM5+gwxQ693ywnSkhUT8RIuo9rrLX8EzMBFB5u9H91tvRlkTdMJt1wNl3sDEl0Ncdd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ofnytu9c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ofnytu9c"
Received: by smtp.kernel.org (Postfix)
	id AC1D6C116C6; Wed, 20 Aug 2025 14:59:17 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28CEAC4CEE7
	for <tools@kernel.org>; Wed, 20 Aug 2025 14:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28CEAC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61a2a5b0689so6850480a12.1
        for <tools@kernel.org>; Wed, 20 Aug 2025 07:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755701954; x=1756306754; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nSjL547IQQQEU54ydHjvxbeK5RWiqc6aQZ/eqZkTdmg=;
        b=Ofnytu9c5Gw1juNaSg5ohXOGvxeWHISnHgLa44xnT9QkJH8+dGpKmSQCk5i0ysAcm0
         VmHAv60bFgR1BmyZ1NpVhxA1bnV/c8HiJOaUXgmv25nEIKzkT28+4utbW1slA4eVKL2A
         gGLS0/FALS3gEpoOPUM3ZNsXblsMoNyBc7/j31hJ8tWJQ3dljiEEIv9Odb32x0kT6Jl8
         gPOsmLql50a7ycXdO2hwvi8rHJ59mN0OxR7DB6+CEqmbpMCFsy+xCYnjvjRjc6c/xYQz
         +GbHe0Mj93rXfCW6pl+dOdK5/KQU+5+/gbeGZewGvdp47tQHCJv5fCNdzie86E6ff8TI
         TmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701954; x=1756306754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSjL547IQQQEU54ydHjvxbeK5RWiqc6aQZ/eqZkTdmg=;
        b=nA++CLe3GDZJ7CdRRLKYK0iTC5yqGBLPuBZGUH2lcTE0th3ws1jvEJx09KrsOJjGPj
         JfiF4x0QCDtUCwyOzqq1MNJxWYXlrKwLHRkJK+GmYR6D/9LsOiK8WS4uI5pw1JKMX+B8
         theovFMbE1ro2QzhYSz4ysnEBcOscPRzCCJmMV7nBrKbUVezkL5VGcgwNsviabwcfJxy
         JpK6S/sEs4w9r/qBBP5wPvPQxrvH7v3sYWrFFD7+5WNA9MAFdRDtlo7ubvpcCwCfydqF
         iEZYJcrhCi+iEs1w6dzllKWSOVBd+qZGcquXpaa6BuwCf0GZOmCrP/V7vO0Scaz+4XMM
         g0tQ==
X-Gm-Message-State: AOJu0Yw6lqn1mm1nIhuqGYkZA1o6ymrwZOTNZ2/CJ7o7ZDwYHj4nTTk5
	CqbPGHV6WUcYINrSQCzN/paFribkxAir/dBIjij+//GV43B2pWSW8xqeVIpY9fEdz5xuG1ZfEAd
	jJnvqEAe0Jd8XNgs/caJ8zXvTOKysI0RHRbOWeDh7w671ywurHXF9XMCy2g==
X-Gm-Gg: ASbGnctCNqKzMD6nGc6zn2S1bMuR3+DGU0uuVrsb+rEOLmSe6JGZn3MUH4NhA23AJ6F
	7DiTZIMC38doNkK5QLBWkpOA+1SM5r+OYEpJq1Qg+IJq+SG8MtXF1xfs9QESN5WYI/2trV6A+sf
	9vT2OxOHL4mQNA6mP/+iQqthZPeLo+sXOSbdgO3jICMM/7JIkZbUx6I5+AGgCKCjvd4l0xbM6Uj
	HxIDQjE
X-Google-Smtp-Source: AGHT+IF4LVt+pZc3AYJVcg/ZLaShATunSuDLUvIcBNObI08YSi0Ifu7Lagy9We5xHiAWAPULxGR8RFzffC0kNKQ95lA=
X-Received: by 2002:a05:6402:52c2:b0:617:b6fe:b6a5 with SMTP id
 4fb4d7f45d1cf-61a9781652fmr2950616a12.27.1755701954350; Wed, 20 Aug 2025
 07:59:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAAjaMXYtY62_KeEbshWA4vjhtUzNgTO0wffcZXNy95EqvL+Ovg@mail.gmail.com>
 <20250728-b220380-b43c410aaca8@bugzilla.kernel.org>
In-Reply-To: <20250728-b220380-b43c410aaca8@bugzilla.kernel.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 20 Aug 2025 17:58:47 +0300
X-Gm-Features: Ac12FXwZUkd3kgHiKCb26dt_AQsluau43Y4DlaiEZwWevo4JDJkdz9Y9JSDoRLk
Message-ID: <CAAjaMXbH9k36tDiwc-RVLVOrE6HBnEfSkNxemmXKjzpRfmngtA@mail.gmail.com>
Subject: Re: b4 bug: "Error tagging the revision" in project with git submodules
To: Bugspray Bot <bugbot@kernel.org>
Cc: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

Ah, happens to b4 git repo as well because of patatt:

$ b4.sh send
Converted the branch to 4 messages
---
To: "Kernel.org Tools" <tools@kernel.org>
<-- trim -->

Error running checkout into sparse workdir
fatal: not a git repository:
../../../path/to/b4/.git/worktrees/tmpgg1xbvwu/modules/patatt
fatal: could not reset submodule index

Error tagging the revision:
Recording series message-id in cover letter tracking
Created new revision v2
Updating cover letter with templated changelog entries.
Invoking git-filter-repo to update the cover letter.
New history written in 0.02 seconds...
Completely finished after 0.05 seconds.
