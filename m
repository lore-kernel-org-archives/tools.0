Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67964149005
	for <tools@linux.kernel.org>; Tue, 20 Aug 2024 07:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139581; cv=none; b=L2TQ3enqfSr2QjVwzMhIrZ3yZvPBC7/AARMI0kB2Ci6Mb8sBL+pD1/8iReSuuFFhtuMzkAV+gFQkcJBZDcmM6+orf0ZbSTY2dgY9FvcTdXUgX+Ku2+MdvRO9y28ABrAkET0Q9E9CMvWv9NSIUNUr3+UWH0tfomLVvO93lX/y0qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139581; c=relaxed/simple;
	bh=ejss5pkZTsYWwly1zIaOqQPK7F3ZP/tZeehMHG8+bEU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V6SaeP41sgvCAbSQz+9PnldVKZ/yAswEEaa2DjE2SBUpBQs8m23y2T0PtFlf/hhUM5uJfNDP1v+DRLJB5EzNpAYe1k3maSRUznkTkYuKL9Sc4md0khFU+TSa9Af8xKzmx0vdX+pHHnNUyznKhxX5cc0uz9r9KL0S0E0SOuOUMp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QUuy0m4D; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QUuy0m4D"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-371a9bea8d4so1560898f8f.2
        for <tools@linux.kernel.org>; Tue, 20 Aug 2024 00:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724139576; x=1724744376; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9POGw+0dkCoo38oZMpvHEa3RpeTyI0hVTEIEfkm3nA=;
        b=QUuy0m4DAz1e1bOl+zUYuNKZuX4vkoP90GuOOgXuK1ANyTv6AQfQBCDlmL670GfOYG
         MPQ6gJIfzwL6GHMd6e0QtLq+zOZXqxl/VXJC4/fF5vtXlCUlrmufliR/ZKVYkr3sVUoZ
         4SQYHE7vqwVSpVHZjt6iJ/QQAXm6Zajp674Gy/YzLXjxlPsB/dZ1fEz3p+E9gLxI3dza
         eFlx3r5KP6QE3w/B/yJZ4LX7/M7GWP5aULRLoeu+/k+y7vU8exmQnDg7SoFBl3mFAIYR
         ws3ryw5+bNitFZJzwdbY9HPdMCw6+7x94DdvUHdQ58+B5OBJv8vz4BpE5uIo/1yFNtN4
         fXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724139576; x=1724744376;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9POGw+0dkCoo38oZMpvHEa3RpeTyI0hVTEIEfkm3nA=;
        b=cn67kd5xlROVZOieWOgb/laNMB00N82oOR/coLHQ01U6hp2IIMOaxftyhunk1NEkmx
         VWCHFjBQ1Ji3l4S60c+AhKHsyLYODjB3tXt7MFQnDSgaW1tyepINkUYgpZfUiCNIO5Iq
         sjalvwiBAIvRcm+n9HVhTw+K8EM618MsZWJ9YQnQeeI7iF3C3UuXZMJ9g6WnSxStaBpw
         dLNeQtixFgE1ugJEIKBs8GtK+KSpyjQOgiz3iCPLXD4gw5RvHZxMKhfB1oMfvu4Klnk7
         U9qav46oZiDxuIxJ3OSR42Ix73VRyMQyc+iC5PtNOzw1KRlh9tuEdDCiQNcCUSuMaHTX
         9KGg==
X-Forwarded-Encrypted: i=1; AJvYcCUlgUz/80CEaSxB17lp5n59unh0EzyRluO13WzdTFIQPCFyzojLe0YJ/kjzV/DfPAr1oFAwdg==@linux.kernel.org
X-Gm-Message-State: AOJu0YxfF7TAVaAtBwVwAl8Zx5DLV+U3q9cLYAyEfOmN9bQYG3a1TLyi
	qK0fMnTMoArJY9JWhyBlZGXZCdEBHhUgl068o9dhbvJid5fs7T1Tev+XU2VgPzg=
X-Google-Smtp-Source: AGHT+IGIue6x2TN8F22YpzS8vmSmD05X6SxRDI7LYETZ5omDHcbEvzZwNwPKWZ3Es1mCqvn5Qi0gow==
X-Received: by 2002:a5d:5e0b:0:b0:371:9388:2cdd with SMTP id ffacd0b85a97d-371983d5f44mr6437368f8f.17.1724139575984;
        Tue, 20 Aug 2024 00:39:35 -0700 (PDT)
Received: from localhost ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded364fesm185157655e9.27.2024.08.20.00.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 00:39:35 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>, Lukasz
 Majewski <lukma@denx.de>, Marek Vasut <marex@denx.de>, Zixun LI
 <admin@hifiphile.com>
Cc: u-boot@lists.denx.de, tools@linux.kernel.org
Subject: Re: [PATCH] cmd: bind: Use device sequence instead for driver
 bind/unbind
In-Reply-To: <172413500327.69624.5444644456831665790.b4-ty@baylibre.com>
References: <20240802092820.917450-1-admin@hifiphile.com>
 <20240802092820.917450-3-admin@hifiphile.com>
 <172413500327.69624.5444644456831665790.b4-ty@baylibre.com>
Date: Tue, 20 Aug 2024 09:39:34 +0200
Message-ID: <87wmkbve15.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mar., ao=C3=BBt 20, 2024 at 08:23, Mattijs Korpershoek <mkorpershoek@bay=
libre.com> wrote:

> Hi,
>
> On Fri, 02 Aug 2024 11:28:13 +0200, Zixun LI wrote:
>> Currently uclass index is used for bind/unbind which ignores alias
>> sequence numbering. Use device sequence number instead as it's
>> the number explicitly set in the DT.
>>=20
>> Also update documentation to use sequence number.
>>=20
>>=20
>> [...]
>
> Thanks, Applied to https://source.denx.de/u-boot/custodians/u-boot-dfu (u=
-boot-dfu-next)
>
> [1/1] cmd: bind: Use device sequence instead for driver bind/unbind
>       https://source.denx.de/u-boot/custodians/u-boot-dfu/-/commit/0c4850=
7eee08b5e7d4e8484727efe47cfabff0ee

Somehow, b4 did the wrong thing here when running:
$ b4 shazam -s -l --check 20240802092820.917450-1-admin@hifiphile.com

Grabbing thread from lore.kernel.org/all/20240802092820.917450-1-admin@hifi=
phile.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 12 messages in the thread
Assuming new revision: v2 ([PATCH] dm: core: Show device sequence instead i=
n dm_dump_tree())
Assuming new revision: v3 ([PATCH] cmd: bind: Use device sequence instead f=
or driver bind/unbind)
Analyzing 0 code-review messages
Will use the latest revision: v3
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
  =E2=9C=97 [PATCH] cmd: bind: Use device sequence instead for driver bind/=
unbind
    + Reviewed-by: Simon Glass <sjg@chromium.org> (=E2=9C=97 DKIM/chromium.=
org)
    + Link: https://lore.kernel.org/r/20240802092820.917450-3-admin@hifiphi=
le.com
    + Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
    =E2=97=8F checkpatch.pl: passed all checks
  ---
  =E2=9C=97 BADSIG: DKIM/hifiphile-com.20230601.gappssmtp.com
---
Total patches: 1
---
Applying: cmd: bind: Use device sequence instead for driver bind/unbind

It applied:
https://patchwork.ozlabs.org/project/uboot/patch/20240802092820.917450-3-ad=
min@hifiphile.com/

Instead of:
https://patchwork.ozlabs.org/project/uboot/patch/20240802092820.917450-1-ad=
min@hifiphile.com/

I have fixed this up manually, see:
https://source.denx.de/u-boot/custodians/u-boot-dfu/-/commit/73f5b54a589cb6=
ff97aaca55e7c97d68b43997ee

>
> --
> Mattijs
