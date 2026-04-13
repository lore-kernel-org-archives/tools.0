Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9914E34404A
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 21:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776117372; cv=pass; b=uOyJWR2Gp/jX5Wqj+UNXRUYfHOuXXPI3IYJzV6QNgi92xszeFBuHqr/tA6+sn4/cknYhSMIt/LkSlixWrMxJJGQOjM1MwYf3Mlyytp+dVv+HnJG1dIL97/xYWmSDzcKLmYGATUnnet5VNr/1GSeTR8IUBB7Ey4lIh97UiXKCIgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776117372; c=relaxed/simple;
	bh=2EDN0Vt/r78XuqR6IWrR3NBfBPREVIbVBNo+qnwkFU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fwys6rCjRrefQXeam4g8YyoIMvJNWrZL/3QUEsj3GzCspx9qEYamtT/hFhlNsKH1SRgiDOqcCq+IBcjbgMlfVzD4IbfrqgOQP3cjzy83/dkwW7pqvdpE4ht8I+yHGzoAkrI8G+nrBTWRe4LWffGbbMQjGBY77MAsAbO6UO6q+OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bts/XzfD; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bts/XzfD"
Received: by smtp.kernel.org (Postfix)
	id 3D08FC2BCB3; Mon, 13 Apr 2026 21:56:12 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B873C2BCAF
	for <tools@kernel.org>; Mon, 13 Apr 2026 21:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B873C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38dd575bcf3so52262291fa.3
        for <tools@kernel.org>; Mon, 13 Apr 2026 14:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776117369; cv=none;
        d=google.com; s=arc-20240605;
        b=h0VN3odZlccbnuzu2+ukMfkcuSo+KmNJa6xJ2HtFuOwZfPXWNlVKVVHSolExoLR5ZA
         HHgQY1bAePuxSmToV/IPFd1idot8fOsfeLd0CsXONRQVaP6qhMiuWXGSRLdws8g6hiUF
         oTrQXeE+stDxkvV10Ai/ncN6mf80BYtZtZH7hPo28A4F9WlDS1PtZ4VzU26BMoYPb30+
         ZaANtGKaHdz6gFqgq+UpmlFAgitmfe4ClBtPe/TV18qssgTnaq7aROYEhRoUHtqOEKpq
         ET6qp7uvlhInuiGCMfwS7EWpmGXZ/54a/Hr1lw49IAsDcQQusnYeCi2kAvTHjozo/noB
         NHHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2EDN0Vt/r78XuqR6IWrR3NBfBPREVIbVBNo+qnwkFU8=;
        fh=IJqJYq/8aA5bZ5zN54OMKN21XKKG5OJ3sR8aAJnlCLI=;
        b=SivqZ7kTp6ilIWptUok7LksO5XPcSC7uzPyo13MUO+S+j76eDjAFYc990+Vj0gaLr3
         /sji+WCZss1W3eD7219/hCzRJIj5sykLUd06ojXOo5U/Bidow+InUhmThl8CO6Hn0l3G
         lT7KrGDrQIl0VHLXQcbdiBdE5XUGrQSw68yMwqcVXpEIPcFvu31+ZqxYpbBjWvjRTTUj
         ove09H9oTUhDEmhcwpHjHHaNhovofduDw/uMSRExzF6ngT7FG7dnhE/bg8LtigO14XRX
         mMCVJhDRpW7ay8I1ZYYzoOd4f/wBbql4Lx/j2NVtJQ0SQxeW6CgXHA53nMbvd6cdZESW
         p3Kg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776117369; x=1776722169; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EDN0Vt/r78XuqR6IWrR3NBfBPREVIbVBNo+qnwkFU8=;
        b=Bts/XzfDJHrgSHxXBomKR6QVSORGs5CcyXnH6QJ/xNa6GvqMX0jXr68fev+avyv32Z
         i9oL4BCkzvNiMOemuvBEvdF88XDIL1/TQ0rvRmKpswbNF1ypDa+uf93YVQSYlRI+/cu7
         G9yZGnqyIiDJxScF6AAPc+7XSl/P8y5Reb6EPZEmXmH9FSrrV+3P+SynFh9jgRxYARJr
         QW9TvcWIt3UqXHyIVzYARHSvqgSIsKiJhExPB/dz7/E5P8Ww6C/L3h6jn00ONJh7pmBN
         qOqRE4LGtXBuhBkmeq6mKe/A+gv7El0fEu9s987msd5BPIvxn1lopCc0Ns5Xd0x+zLti
         FNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776117369; x=1776722169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2EDN0Vt/r78XuqR6IWrR3NBfBPREVIbVBNo+qnwkFU8=;
        b=XjekxHL+yVWqGHCVs8faulG4RAZefnkehaooAZj8sLABAsdzbr2K7BWsRjkyOc4cVk
         V3KG2d6zW58LfsVIwsPLDKx9XS4TJ+sPOfeQXgZVHIwIDho0mvZIas26elNWCee0ewf8
         UflmuY2QPHOw3IXbWW4IXj5jU2yspnMLe15C7+9N5idc5ojJqJ2NzRyqFpwGwUcJmvNx
         qKLR3MIHYE+smOuuIXYyWOFZr5/nnfggCDuSknd8bKEtmaspKDjepan10zDoWPeH5hly
         rOXFDbVAzUOBO0tqL2s0JSFqT7yF7tuKcLX35CofnznDnC2kOp0p4jy/gtNDd5GtisTr
         +H9w==
X-Gm-Message-State: AOJu0YzaAmDOTwZf9m77ZHwI+6q9a6MzI/MuWvsyZWl9a1IViEehu3DY
	JrIFBhoi3Ra2hSY71AoLPh7ZMKEqYq+nN8HGmJperHWmzziRBnXmgCjdlB4f63jpR/TnbMUGO8x
	FG6ZiBJF0rTYTuGSXdIblEHIahRiTFrk165sY
X-Gm-Gg: AeBDietfSEL1xKaHRI+P+oR3voeLjLGZW8ySkkXDnvk0UTPxCjXXGFcgl3NWcyOn2n/
	aA3MYVgIJjCvck/QzP18u3NSzNFkb3wX0FY7yMADU+T+MHa+Ul3MiJew0tPvrXUVbTOal1pNat6
	kt/TRAmuHYeS2Go+bItmcdHj/6Xc7MKBgN+vUgSaupKedwFa2r094RaDIiqfXbwaTvtrqjDcXjI
	7YG72qoiPIjxWMrZMW03rrwkW1ATGYQWWEs25U9iUg/Ba1J3571y2qehMF/0ppKWhUCO1U7iuXx
	WiVsMEETIb/HSgz5M5VVt+bZLyGvhFfhKOxkArPGnpJPjym9VFPGduw5t506MixlUU3ZIGlF33p
	vIJCn1JNXOwe8VyktZSLDyzGd5Z+a8/iGapnVEcloPLZ1OwLDKXJB
X-Received: by 2002:a05:651c:4188:b0:38b:e464:f047 with SMTP id
 38308e7fff4ca-38e4be29293mr41381221fa.12.1776117369172; Mon, 13 Apr 2026
 14:56:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
 <20260410-harden-type-checking-v1-1-fcf314d9d748@gmail.com> <177611517998.749969.8235396053359093909.b4-review@b4>
In-Reply-To: <177611517998.749969.8235396053359093909.b4-review@b4>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 13 Apr 2026 17:55:32 -0400
X-Gm-Features: AQROBzAP5XyE8vtrcyIH7l3vsEDH1x3GAYgHdrwJgq9oo1purPL7H2D9EVI5zJk
Message-ID: <CAJ-ks9kr8QPp5jx8QRueN+XOCahTjvmMm1nK7KgbLK4+szbNmA@mail.gmail.com>
Subject: Re: [PATCH 01/14] Add b4 CI checks and mypy suppressions
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 5:19=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Fri, 10 Apr 2026 18:37:52 -0400, Tamir Duberstein <tamird@gmail.com> w=
rote:
> > Add a repo-local b4 CI check command and helper script that runs mypy
> > and pytest so review status surfaces local checks in the b4 UI.
>
> No, this introduces a hidden vulnerability -- we're running a script
> from the same workdir with code modifications. A series that modifies
> tools/b4-ci-check.py will make the code run with permissions of the
> maintainer.
>
> I am cognizant that this is what we do with b4 review and checkpatch,
> but I already have a fix in mind for that, plus a check that will
> specifically refuse to run a script from the workdir of the series.

Shall I drop pytest from the set of commands, or drop this patch entirely?
