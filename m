Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C681D2B1B
	for <tools@linux.kernel.org>; Sat, 19 Oct 2024 05:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729316595; cv=none; b=gciON3Mz06hc6L2tmNCAN7/ZkRwsgaZ7jlfN8jislZr5p45vNk86FmvVePRJPOmAAepo8KOh9K1KZLpqyjm7iZzeOG3cyCyIB4ySz+Mp07c7sZr2li6eg3nZdbP+D2dJIgG8D0T+zKfIaKIGxMTz8SNA68Hk7+fx06ClweOlqc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729316595; c=relaxed/simple;
	bh=O5xan1YZPrcD9Pq7fhbR6R40qbvx3QgOS/+p5HFA9Fg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=UPWRfOFHWfahJVEEU91H1bOmwGMCeHAqytF7ULnFNjYUefb9bpYOU0b3/CBy4D3F6hN0Z+biji4IWqddtue5T7YqB5UPmD7lrfH63wrBEAMov0cTtnvLYkiC8KMK/ZkGL8bRIZveiyHfG0tFB4pfuWsMfOJ+5WkRJtveTuTWsYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WK4SC/0R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WK4SC/0R"
Received: by smtp.kernel.org (Postfix)
	id B3C10C4CECD; Sat, 19 Oct 2024 05:43:14 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FBE5C4CEC7
	for <tools@kernel.org>; Sat, 19 Oct 2024 05:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9FBE5C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6cc2ea27a50so31667526d6.0
        for <tools@kernel.org>; Fri, 18 Oct 2024 22:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729316592; x=1729921392; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O5xan1YZPrcD9Pq7fhbR6R40qbvx3QgOS/+p5HFA9Fg=;
        b=WK4SC/0RwzQwswiSyPhMMTAphmEwVqPhEW3KC29GbARoETEWw2j/tAQxPkOKdokXaB
         DyNH6QWVq9C+W0gtYTsTFSg9cNmDgE5f5kRFZ5bL+hcy+B64tS1cxBX+GGTUpUGXacvu
         O2uZYC3pM97cvj+AYs1TefWxTtAmYwA9SDMLxrndZLiB5FOSHObNDqPwahGAle/GoG/R
         idrysFUhAkQyVSFXZaLET+3W+JF/acYvhRntJknCLClibhfoZl2fSsHOR3akCfIobgVH
         BR20vzpRZGGrWmCDrbpqzZPj/RkOujw3hGQjhEQM0wlYhpzJlhUkL+Q12JpAzwpHB+vq
         V5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729316592; x=1729921392;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5xan1YZPrcD9Pq7fhbR6R40qbvx3QgOS/+p5HFA9Fg=;
        b=eKFuFMAxFo0yNrv5XGfrLkejBWGbHNQL45AvinALuroTBC58RCqDzTDuCwAeEAMYiX
         ZKT6tBZ6C1mbVYNHckGWZjT+ZwhFhAPP9n8GA1linEV2ExWWc967xGGwfH9azwdoCOmH
         tJD7/8YhMgrO/PGM9dNKCRo1fFOcYOyZPNmFMR7E1lRLTnc6fK62oulzFcqN7jNwkZx8
         sbvtIHdCzgx6d5GQZEpZxOZNk5f8k/Yjfk2lXnc95MLJCr3hWPBvkcj7k6uh+ZkjOqRp
         MyDeaxEPhUJ0AyDpSBBJNtE79j+fGj+DYKSnTy2ItBRwGa9D6ziWJKqG7ktOytGoVqa9
         QTnQ==
X-Gm-Message-State: AOJu0YyBIxOzoqNZFx7BsBWXClRKbRgbBPH4MSXohXmoMLLKuaEA9aou
	aBztWGLG9dx1C5OEU/lpnBm/NBWa7Gs04bQK7tK8okO2CjFLJnpSIfC2Py96aW21aF/ecAQY8oJ
	2BcbQkadoUNvAMYZ8q2RSNXoSph8PVh/4smttHtsg
X-Google-Smtp-Source: AGHT+IH1FSuOoQfA7GyrHxgbkVA/2RRiEQw2ttIAT+0xiDHqoZp7A4cjstz/cDFtM8uN6/03dOes2U1AkoCMjhslNhU=
X-Received: by 2002:a05:6214:5345:b0:6cb:3da9:d5a2 with SMTP id
 6a1803df08f44-6cde1b5d645mr65963446d6.19.1729316592073; Fri, 18 Oct 2024
 22:43:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Cryolitia PukNgae <Cryolitia@gmail.com>
Date: Sat, 19 Oct 2024 13:43:01 +0800
Message-ID: <CAANcMPn=CYhCUAOAooGAKXXSYyOpxpj6dEAssUtQ7Zd9PY0BqQ@mail.gmail.com>
Subject: Missing `Signed-off-by` line in patch email
To: tools@kernel.org
Cc: Celeste Liu <CoelacanthusHex@gmail.com>, Yao Zi <ziyao@disroot.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

To whom it may concern,

I am a newbie recently using b4 to contribute to kernel.

Several months ago, I sent a patch with the wrong format.^1

I forgot to sign off my commit, but when I run `b4 prep --check` , it
didn't warn me about it.

I used `b4 send` to send this patch to maillist, b4 appended the
"Signed-off-by" line below the wrong divider.

My origin branch is on Github.^2

1. https://lore.kernel.org/lkml/20240726-typo-v1-1-3ca3f07f93e9@gmail.com/
2. https://github.com/Cryolitia-Forks/linux/tree/b4/typo

Best wishes,
Cryolitia
