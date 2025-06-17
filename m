Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54202E2F14
	for <tools@linux.kernel.org>; Tue, 17 Jun 2025 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750162134; cv=none; b=dfnb0YiC69r6/iLcZ8xrgWDh+R7Ob/w2sQzY37puv43Cuq3qmUbpEzN4irS59zKTMRIx+mDRG4OWEZ8wjxX29dM7fFStw6EoZdeHFTtQr9UOhj/3cLzZ6LfL7JQp2SB4UgvKeYbQ36jmhslaCZkDyRPzBK3DHP05WonRZWCIhJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750162134; c=relaxed/simple;
	bh=hol8Y4KAFEPlWLZf5l4HrmnpL7xNmLx4AE9JLBSvKLo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lzam8dtKmlDW7Fj7jh61BD8YNH/b6lf1jed6d5pZ8plCAaB3+NWGmcgLNshfY2BkWzHG4AAQKsQh3qGm3kCm4d5c9nSWlB0ZU5ntiDoidRgo1T2Hi2CVkEk15q9veXtQqYjDfSgSDsRGBal8RJJUfVoaHKd8mT8/8g6U0rDIa+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDOlCnUB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDOlCnUB"
Received: by smtp.kernel.org (Postfix)
	id 70C0BC4CEED; Tue, 17 Jun 2025 12:08:54 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5005C4CEE3;
	Tue, 17 Jun 2025 12:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5005C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450dd065828so45394985e9.2;
        Tue, 17 Jun 2025 05:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750162132; x=1750766932; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yr8tf490dLZcrTR7ZRtUOPxPJ+C3QiVC034zaGj7oxY=;
        b=nDOlCnUBzKZPnhbCYIibkdZuQ9QsPyElxQkBAYcE7Ig6OlfbilBi1iWxd3+RieBIx+
         s/TTOiD8L6FbKzWnorF7A+XQICb2UJckSpj7ZQ9EZcZPa3yVWGnHUJfGDZ72tO7DmDSS
         WAnF32YVHloC4mbg73ZHfSj9iYxxH0XQS5iPlhF8JRqN+DAju3DGmsMYnjaSwa7fA9mo
         f6Nx9xnBD9fHqTot+bkJnbR9hlFZSLsQVRagIZvT96MEO85OwowG4UMqXLrAPKDM3oxx
         JcSpBVpLAhfyb1Pwgq/XgGBeUlOrVQrzza/Z9CHcYrbsAj4bpKdpFTzukHVf9nr2+71+
         4qfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750162132; x=1750766932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yr8tf490dLZcrTR7ZRtUOPxPJ+C3QiVC034zaGj7oxY=;
        b=FKXBbyMn5G1mFrSP3Bc1HJHE5Poao3lSiBOrwNJt/ViOVf32P3ODcLsrfbc4QZUsOq
         R9EHNm7mq/35VbZfJCUF6PlBANO4M1F/u7TRc3BwjtdoUNaVTDm+O7lJ8uIQth4qsqOG
         WzYqI9OlLex3Chztt/cjHvMo03U8A0giSBnej2F0ROSI2f1WTpoiyvxWAhpVvl18o7WS
         4vtRoTC1MxeYsQwH/UrmhMPhLKyVmkR/OqheqQDHNbtALC8acj+wa9Bk5cbQ5NKMeLTY
         OVsUUoGmaABM7D0gxnfp57lS31sHhYUB/IkpbWZmOguXXfB6Encln23Aq9r8UEH4/6NJ
         +a2g==
X-Forwarded-Encrypted: i=1; AJvYcCWlDi0Ph2QyxdROgcGfzshryEzJL5u2LMGPvrvf1r0PAq3+ssqxXgzaJ0yXUcY/dNJeqzrD9w==@kernel.org
X-Gm-Message-State: AOJu0YyTn1WvHQ9SnGhCs0+AWBogz3kyFfActO+I4KSkfdBuf9FlO0CV
	3cIDtTt9hbGk4a8PQhA0C89cCnJifX7KIhzeM2v7takyH4sL3YydbY4o/bo7mw==
X-Gm-Gg: ASbGncv7OTuEQzJiAENLAhBR1XPU4cz5KSNS/ppJyRudWZMZGxcQ3DUoddVlCV26NYD
	rP+9HJesivKE2LPjbpPTWStnT4LnbVs4F4tPxgUaurF0I9sg2eDA0apA/fQFgQiWzzbZdhLMuPZ
	WBrBkSSAN67ahOdi90kYah0DPNCyd0fIfESkhHq3itWzUGYSMsi/lemEDNGws7MvUcIsJ8BNm2s
	/odIyDMi/q1+783ssY/KzayNv4ZCKe7/gUjGRsd/fyFTkf5LxfUWUlsZ4BiXOmJp1I6TQOTYvrn
	JWjxFhOpkw8bm7b9g8EuaLHaG9pqnmvytj02CTWO22CDqKYp1flHYCGjf2e+Giqu6TjZvs2gPCd
	SHaru2HlS7CMgvQFTF4HJfmo7
X-Google-Smtp-Source: AGHT+IEIOX1GzSo473MBZ+UaEARhaHXuzm5oUIXccFwfpiU+QMAiIUkNa3q26+k+e/fOeO+ip3BxCA==
X-Received: by 2002:a05:600c:630f:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-4533ca8b32fmr156454475e9.10.1750162131655;
        Tue, 17 Jun 2025 05:08:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e22460bsm183509415e9.6.2025.06.17.05.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:08:51 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:08:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
 workflows@vger.kernel.org, tools@kernel.org
Subject: Re: [RFC 00/19] Kernel API Specification Framework
Message-ID: <20250617130850.4f558701@pumpkin>
In-Reply-To: <20250614134858.790460-1-sashal@kernel.org>
References: <20250614134858.790460-1-sashal@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Jun 2025 09:48:39 -0400
Sasha Levin <sashal@kernel.org> wrote:

> This patch series introduces a framework for formally specifying kernel
> APIs, addressing the long-standing challenge of maintaining stable
> interfaces between the kernel and user-space programs. As outlined in
> previous discussions about kernel ABI stability, the lack of
> machine-readable API specifications has led to inadvertent breakages and
> inconsistent validation across system calls and IOCTLs.

Ugg, looks horrid.
Going to be worse than things like doxygen for getting out of step with
the actual code and grep searches are going to hit the comment blocks.

	David
