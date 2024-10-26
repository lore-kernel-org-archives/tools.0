Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5BF1D31B8
	for <tools@linux.kernel.org>; Sat, 26 Oct 2024 16:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729961898; cv=none; b=dumXS0/2UisC3/RoH6Q1U8yCALrrG3weexZsXlwqWi+75dHxjnfFhoiwWmy3nYoJbBFNBbs+LVzj2yZQtT0TFzSmrXHgp3bxJqFgud6SbFRKIwE5uN1A6Y1lYHcEnSQFdIJwcoTjw8hl5UUFZmtqkJlxSPkUGVAmJvFaNmUwRwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729961898; c=relaxed/simple;
	bh=yYNG0PejdE1t2BsHEjHG0pnEKFjfyBad7LM43ZyNk3k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=pVnbXWH4sGmfyAv2YSyb7m3hSTy9fHGmO4MyLRDJe55xflTzdDsZLHD7g7+TkUx23EaofzoxTgX7J439az54DI8OYqq0LADeVaom/ANeDzxIEnTPP2FuyJy7qGFwvHZK3QYmNP0XrfpHZuvySNq4xeymlSUP2GYrKftjAZvNlQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKMb0xZy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKMb0xZy"
Received: by smtp.kernel.org (Postfix)
	id F0DE0C4CECC; Sat, 26 Oct 2024 16:58:16 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02508C4CEC6
	for <tools@kernel.org>; Sat, 26 Oct 2024 16:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02508C4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso27999751fa.1
        for <tools@kernel.org>; Sat, 26 Oct 2024 09:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729961893; x=1730566693; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yYNG0PejdE1t2BsHEjHG0pnEKFjfyBad7LM43ZyNk3k=;
        b=HKMb0xZyfliY+9OYR3xT8PI+MyrjTe6m2ROCsAqlBEEpT/eTZEVzhff8nFYT+Oyl1g
         VNBRW+ojR+ADkH+0befJ2vD2CQGzNhsu4/Yb1KHF0Fvz7FJ8IiJXzVeUjq57+ahvdhQW
         PGJpVeCw4VZzUZATNkB4QTeDZxo9id/l2X8gPS8IAMb/S4lzno2SOAixQIrQqufWFGUJ
         ErJcc7RjgjHcmhO8uwc67uEw3sozfY2Xj7NF6CSi11tukqhxtY7bAW9BoXBN5Sdd22jP
         U1VAQAMgAiTdeugOLJC40Auo2JAdbEsDs2+163sqOk77J4KTiEi4L9A4y6PnCgQ3Kfoi
         HZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729961893; x=1730566693;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yYNG0PejdE1t2BsHEjHG0pnEKFjfyBad7LM43ZyNk3k=;
        b=Gk4XVwe68Z9fgiRZvsjGUT54F7ankcYAtmoDojztuZXz/pMp9ywUpAhG+HhCrg3TP4
         sa+/IHVlc+u+dgZL94aHBn9HCGmZcXlwy5xXXzovIuBxOFIFxm3vMlLDYN2ibYzy/2au
         ZpF87a8aoygBvbdHo8gy6zhC7fvVE87bA2oo1pPKP/84AYRwRuSgxOH2oHZRun1GFtxb
         dG53TG89fozCd+TNT+azWl5U5kKNM8ZSdwyMQ9Fi2HlUMKqCBVjg/jm028asBme12Une
         OXZED1igHy08lgj+N58+gTYyOA5K8QbLKqfHq6qH3FPm7YypoS6uABYEXLotKdsoRM5L
         4Oug==
X-Gm-Message-State: AOJu0YykDwPg8e+/9eLYnx9MnhuFvbRYQA4PboR3aE21zlFjgMP7bbTS
	/DM1abarFZLBQ8vyP9NxtvDa9Nv1i4StOEV2GtJAEihpGLZR7ZKRXt4dzLMjT3nsCm9QL5VnmOc
	ZvTFsKq0mXcYMKu6peSbT29iwPmBSHjrxlxs=
X-Google-Smtp-Source: AGHT+IEtJcgG/wwil6ca++1yaDADyQ9lGLi/IMLABKIQjxPglq67WblqDm3s6dIhTc9hy/NYtduSa/rQ/rkwv8VZAy0=
X-Received: by 2002:a05:651c:2209:b0:2fb:4c08:be08 with SMTP id
 38308e7fff4ca-2fcbdf6ff42mr9961531fa.11.1729961892858; Sat, 26 Oct 2024
 09:58:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 26 Oct 2024 12:57:36 -0400
Message-ID: <CAJ-ks9nbCtD3OEy=AoHGOr_C6Ai8TknQVHzKCsS5bthm2hw2eQ@mail.gmail.com>
Subject: [BUG b4]: `send --resend` appends SSH signature block
To: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

I sent this patch[0] and later resent it[1]; the latter contains an
SSH signature block while the former does not; the commit is indeed
signed with an SSH key. The result looks quite broken:

> ---
> base-commit: 6ce162a002657910104c7a07fb50017681bc476c
> change-id: 20241016-b4-dylib-host-macos-16757c350b49
>
> Best regards,
> -----BEGIN SSH SIGNATURE-----
> U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7h
> JgsMRt+XVZTrIzMVIAAAADZ2l0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5
> AAAAQFg99wbgHLYJEpFzt5B+h6GLMb65HtsNoryxz5lkEldZ7z5BEXUUDiFLlDnDu8jlkv
> SiANzyz5noKnp8NCgIxQk=
> -----END SSH SIGNATURE-----
> --
> Tamir Duberstein <tamird@gmail.com>

[0] https://lore.kernel.org/all/20241016-b4-dylib-host-macos-v6-1-bbeab5029199@gmail.com/
[1] https://lore.kernel.org/all/20241026-b4-dylib-host-macos-v6-1-d89682f88ab2@gmail.com/
