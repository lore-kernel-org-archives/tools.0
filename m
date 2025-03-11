Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6688A211C
	for <tools@linux.kernel.org>; Tue, 11 Mar 2025 04:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741665883; cv=none; b=eoWd46jK1aQerB5gPKEzR0d7KM5HFnpo+Dku96QfTpirLdtiQrCTpUUKmgYzE05lI7S7RQ7K8khc2ECMbwUU2yqeVXb0TsVVGhX72aCt3CVn9p4mw+aduDZefDoLD5eATszxsUI0R2Hk3fVsw4nbfvK7HbxbPSsm/qR081V4Xwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741665883; c=relaxed/simple;
	bh=7gkXseNG7Ze/EHF4DnLa+JlYo1HvW3+5w/5UFwpYeno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMTisbErX+3Cswf5AnCuSJJwKZO60nSgSIAH1chwcAsastbbYWNNLX6vLBv3rBZ2BnviML56E8RRZUnIKPZ7fSgHYdBwSmCep15CpMhfVcTrQtPL+KxJLS6laiSM9PY+x7GN+kmmXAkxJSCfQUlGPayV0ShBtirJvZax//QRW5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAVepIdQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAVepIdQ"
Received: by smtp.kernel.org (Postfix)
	id D62CBC4CEEC; Tue, 11 Mar 2025 04:04:42 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA842C4CEE9
	for <tools@kernel.org>; Tue, 11 Mar 2025 04:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA842C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8fc176825so38286736d6.0
        for <tools@kernel.org>; Mon, 10 Mar 2025 21:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741665880; x=1742270680; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7gkXseNG7Ze/EHF4DnLa+JlYo1HvW3+5w/5UFwpYeno=;
        b=ZAVepIdQm6k/fHcX4+F0Gy5XcqRdNaubtRGTRju0RPi1s8N36orULcKvbFEXGEpjFU
         MM36yZfbTOUqN0vdS0wpgXbxTcMiO4fsYVCQdpU3nsObClsiivXM7TrlEbBJyTuhIqvk
         5ZAtV4PLEvhnLLLWQnHQ48/erJ79gdyzf8Q2VKWcXHBplZRg6Rp4zKz1mRt0D3cA7Pnb
         Kify/S5O8UEhall7OHA2inuiLqLS4+nEyAk1644AeCyG9Qqg8AZcjctDKikIBRyaWto0
         Mvijr2Ht/g++RjMholIOia+UNf+49FxaiQQV83RZz0Z0XojiYp4ti/LPFz9QS30rObTI
         Dg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741665880; x=1742270680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gkXseNG7Ze/EHF4DnLa+JlYo1HvW3+5w/5UFwpYeno=;
        b=L7KCjS/bfbsFGWcAEqYlHYiOymSsrIHKJxwFtMefciM4lwghMmlZ65mdSzusqIrerj
         nzX1xOfWHptEkGV52xdOseztUK+6UEKX9fXJ88/Jw7Lov9wDlJh3CG1BKF+oPTZFD7nj
         TGw53wOFdHutN7F6j+aQWngdOXVhKsfzGNjVe7azWtxytPvyRgqUq3ryJywnNEgaKUZm
         FRt+zHdUEi7n80g8wotlcljW3rljAtWR8tXOaMzzFtJ2/v+Mgswv5y9UkFJ+gDjiXrWb
         V8YU1m2qyve4Y4LvjeiBSPczvZbU5q/NQ0zrSO9P/fkjsHoxPMmNaJnDCtFOHGp7CYKC
         sOjQ==
X-Gm-Message-State: AOJu0YyqjTVyCVGxNyXE/zIzy1xG4ka3nrt1A9DsCZ3Mp1Xy8xuysuCX
	CW2iFPF9FlKZuRR7Y81EZdNaHittX8TW68GV2kD7AJ4mSpA3Ajzti9V1V2zpAKE2BgtRRB/KqCD
	UZypsoI4Qrs711uFKVnbkKXWXgwU=
X-Gm-Gg: ASbGncuFs7lqb/yDLXC2w0o7isplmFr0vQixeFm5D5FbJ6yyNjvYn7mf4+cgiR9E8D1
	C9pXcbaNZbpg9krtuXEd2NETIP4+cm4mrc8Be6YuRUcPahzfdCL7chUastiT/7YeBFgH1yQG9OO
	7PyE7yA+4ySrpQlDHzty98ESuQjr8CDwxEnbmUj6Iv+FoX8LPX9JmvuEMOZuM=
X-Google-Smtp-Source: AGHT+IGRWSHbKT7uDXQLN/UIys3RwaX4gThNBTmrgk305I0KUAxWyLzRIPDYXWYv7tf+WUJwRUj+YireUAFe8F5WU4I=
X-Received: by 2002:ad4:5768:0:b0:6e8:8798:275d with SMTP id
 6a1803df08f44-6ea23b41d50mr37492406d6.0.1741665879544; Mon, 10 Mar 2025
 21:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20250302-flow-v1-1-3247c022bbac@gmail.com> <20250305-charcoal-marten-of-typhoon-87b3d7@lemur>
In-Reply-To: <20250305-charcoal-marten-of-typhoon-87b3d7@lemur>
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Tue, 11 Mar 2025 04:04:03 +0000
X-Gm-Features: AQ5f1JoefnJrFBHm3bQ0yZESMdobB_c03rb8NwQssclgif8S0h51rR4CGQVqhbE
Message-ID: <CABhZbsVJ9HWD2erq=DGWYB+DwwAjhtuKfBYK-sRe_fW1xonavw@mail.gmail.com>
Subject: Re: [PATCH b4] Add `flow` subcommand
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

Alright, no worries. Thanks for your time and for making b4! :)

Thanks,
Rudraksha Gupta
