Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1779330FC3C
	for <tools@linux.kernel.org>; Fri,  6 Feb 2026 17:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399729; cv=pass; b=V/rk1p1nkAnKuvxYFzXy0F8appFboTN5zzOz51kIQoNU5IDtOwKjgViOUVrsc+U5+w1kxN+NPK2cG+hiYZqR6Lxg0rz2kkXkkUIrjNYR5kTSjtjGjb0poBLZtWbWeP0i8Jhd14vPzPdhton6MsUvA9Lc/7SHzxvgtUthhi9V+Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399729; c=relaxed/simple;
	bh=juqD/Z2B1iqnv2FcnCfjEvvv2vq44bgj3Kduv4ZhpUU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=EQ5BB095Z0t2cxi2Ny1AyLJm7xYh9dTgX/QTDqjrZEwbz3Ae8JV0h5Vgpo+wu8upC6T6D0/6eMxoKJKIgjeAC4ZkaH96EMhor3VYLrA7yGpNdJWN34vi4p3zDOmbmhETxC9FmUsRsyiaIil03JHsOXFxzz0eVK/8uEYUoslHD4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cX8ytVOx; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cX8ytVOx"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-794e0e933ccso10982827b3.1
        for <tools@linux.kernel.org>; Fri, 06 Feb 2026 09:42:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770399728; cv=none;
        d=google.com; s=arc-20240605;
        b=Qmc4tExDUAJzl2sDIbgNADEZnJzlQZ9Y2L1CmLlte7q2+dw9+u/4KtLQi3vk4Av1SX
         MJ6BdGp1QeLbLRNzf7KGQqr3NO7Em9jqHxGHYXCl7suT0kzSPh9o5Ixlsjkc4lze17b9
         4PmETpWOJXuQH0DvxAweHExY8nxCV+ecz1eQ8WGc4EeSTsO1lzn4MrJLfoT5oft8JSlX
         9D+/1bcF8bj7Szwflg0yIzUBgoDES7HQLNwLcD2+dg53yNH/YeaMd9Z2Pr17o/ipVs5B
         wM8qCOv02APK+Hj77ZSeAmI8jHpak2UbH34b9TPX+OoDUrs07agluMYWQVJCasR65pMy
         Ujow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=tvJzSVNBOqrLQ7CPy5MrfaIAYIjtPikwFQPwCLUzv5A=;
        fh=H6VFXKZTWUI/2eYmwMJY7Z+eUgSjlFmbmystdLuEPYY=;
        b=NSvK0IPsBIaU8mQzPdxcaal5GoS/qt0XgF0Q0Or6Grwv3PAzpLFAKbW+92nAP1JJFH
         GXM1qyBVFxIOBol6ex8970w856UlT/bL8NgaMPN/QgmC/+b3NMlVAkK67z956BKvYdDP
         C1tp70aS0Z0ABTUcPXF8ZVQL/5VWduAlWiop9GDMGVaR2nsC6S9pNKRGRtUaYVoLWGg6
         IiPg3WrwzzHParYv1yyP70xT8zugEAmWGXJOfWtVsmTu+T4lJNpCZECvzHkooOTu0MU2
         ATQ/9mthF7c040nqa3mMDMTmQvOwvSYE1+MHB1fd/gd7XWi+t6PkgpbMqzG56IvqPgRO
         R/9Q==;
        darn=linux.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770399728; x=1771004528; darn=linux.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tvJzSVNBOqrLQ7CPy5MrfaIAYIjtPikwFQPwCLUzv5A=;
        b=cX8ytVOxTFOR/SX6gRoF5lm0ulOORbHaGLBmm92d/MckgmnXd81fOYUCk2nivrm5wa
         2Yfr9jgVaRWeJhyRlePfrm1MB7emD1r2YuUTmwWcfSz+CyN1z2sed4A++2ogCMhhxtGE
         5yMxHtPNx6KfdWZyvR8/D5QwfksJalMzLoex3NsSBHlVRwwR3GCGGt/zhWgL2rJRHzEn
         rJ+umOoBFoh7uhWBtxMwjHq01cJLOW7qUnhlpxurwxNhErcZ/L0sgba5KyfivkZQVlg/
         2bVOU6P78Rp7o2nQyW8xtJA7r0LwyuHNJIjA+CbPA4OMFfJ3snwyvylsYjO7oYUlgVdQ
         6j1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399728; x=1771004528;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tvJzSVNBOqrLQ7CPy5MrfaIAYIjtPikwFQPwCLUzv5A=;
        b=sQnOZ7xCIXGPV2Jp0STVvCial7OQG8FRYrd7cBDb5zuR2YHCnzdiYbrswZAbSgUd4k
         D8tabpokSLCtNEm8wKK68QsiGSclJilIB01Fh6O/jaqadsDyfLtRLzZhTbU83ifq66dU
         wnsT7oQdx/Caa/ocQy8DNxye+8RWERMw1uMew7xvecv0dLkkGRoRbMBAEGJlsGPadgRD
         atHzdxm8BBBzUjMQJfFk0DHAHXxZGlpsPWm24LhADa0xigHh4o/rYM6ZhgGC8UPZS9eh
         uOtC3X8B8dQmkbr3Vf+jnPA3hBeu5SLrd6PjXUgyg5M5f9OHXmIC0pliiBzbyUngmspV
         drog==
X-Forwarded-Encrypted: i=1; AJvYcCVAjd71o8lXI78/a/B/SY5X4fz5URrK6CSZqM6Z65+7R6/7X1ggkhbCXabN9z+oVYR9eiAA1w==@linux.kernel.org
X-Gm-Message-State: AOJu0YxgN+eglZ1Igb1kuUXNJlRrWUkZDvHEnZCmIjWUra57PBR4unWV
	E85N7a+uejvvFLBJrh0RIC8aQOejEd378wq/oP5Zn3nCYivfl5WmdFMzlzU4vrxuxD+v29UHSPd
	irvWb5Ss1QjBcUOkzu92X1hx8qUHNYSI=
X-Gm-Gg: AZuq6aJ6ErsduySe8Xn6GvOR3XVwp/cToPYVlT+ieC5iyn7V2rP6Ow+SfleWzHmpwJe
	Ae1qz+yAkqsyGXkYDRBBv/RctXAEIE45Y/wZL0xF8oJvtnb6Q+mpKxX5mzJI0qJyz1qRfM3V9EO
	ySMOauIk4A2ax+uiLSjQMf3gOV239yOtVtkezJB4KB1qkE7VWmf1yuG0BA5LN+qS26JEUiSrq5W
	w/3qo6J+L+kuIFYOF9T8b29xIIuNdjM0fKB6vZyGceDwIxEMfRH4bFQnv9embj1alrp8OjQD2zd
	0UjeKSpKj1LpWCXFRHmU7ANHgSAR02Ax+hkpQSTISvLNJ7PERLs=
X-Received: by 2002:a05:690c:7305:b0:795:272b:1ea6 with SMTP id
 00721157ae682-7952aa7490amr32960417b3.8.1770399728099; Fri, 06 Feb 2026
 09:42:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Mario Limonciello <superm1@gmail.com>
Date: Fri, 6 Feb 2026 11:41:57 -0600
X-Gm-Features: AZwV_Qg4Rfz7uRC5oZstGrLbCeODuN6U0mm4ElBxx_7c6KMRe1pVxzM4TDDovMo
Message-ID: <CA+EcB1MR6VrwpbXc6eTOzvK5dN6R_n4DBQ7ZEvrPP890syKBww@mail.gmail.com>
Subject: Korgalore Office 365 redux
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

I've been trying to get my I/T to enable it.  Because of the
unverified status they decided to make a dedicated tenant and
dedicated client ID for me to use to experiment until we have it
working.
After a lot of back and forth they have the redirect URL for the app
corresponding to it set up on their side as http://localhost.

This gets me much further than before, I actually get a
Authentication Successful
You can close this window and return to korgalore.

But then when I go back to korgalore on the terminal I'm left with a
sad message:

  File "/home/supermario/.local/share/pipx/venvs/korgalore/lib/python3.14/site-packages/requests/models.py",
line 1026, in raise_for_status
    raise HTTPError(http_error_msg, response=self)
requests.exceptions.HTTPError: 401 Client Error: Unauthorized for url:
https://login.microsoftonline.com/<tenant>/oauth2/v2.0/token

Obviously I swapped out the tenant for <tenant> above.

Any thoughts here what could be wrong?  I'm using KGL in WSL and
copy/pasting the auth URL into a browser outside WSL.
