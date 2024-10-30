Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082C81E0092
	for <tools@linux.kernel.org>; Wed, 30 Oct 2024 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730283384; cv=none; b=PX2ZpPCh4/tOXB0IbmYV9SzmNi6Sq3E5UG7qgvbKHCw+N5Mt3Tc3eLuBwzdTzsYielWOTEmA3g3FA2dp5lxtx6xcas0KUsAju223TbTXWbcsPUtL1b8SsXMRQuWvl4oZevAUg+pR/cAI+2W3wuVgiMxI9XuEeidDBH+W9jrnkiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730283384; c=relaxed/simple;
	bh=iDwlDjJgaUUCtMK6klxf6nX5SB711o9drk3vSTq4f9Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cK7YzM0KpS2xJol5/DZtliPcocoy7ttwITeUMc3bndRvQQizasEqAdJF3gGhXgzyjay15VUbGcSRAcrwVT+be5wvPpuVcMtJmiafEip0DuciTEIZ89iPuDh9+G1AXyFEF2hzrFERbYjv3TlDt/l/K9NRtxd1Gua6kbRcFmX8M7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E7Fz89ez; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E7Fz89ez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730283380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDwlDjJgaUUCtMK6klxf6nX5SB711o9drk3vSTq4f9Q=;
	b=E7Fz89eznmVXD2rYOUVuGZvvMHQIHsNT5yg06guDxYyN9dpbAhOMoNnH5FMkW2VOfIrTc9
	OgsEwf+rBRPJ4cR4q+p8U9yshGepMACovNYgLMmAl0VlJxAxD4uaaE0fTDdNDRq+DldhyE
	p08u4f4q4cZe+S5i8l/rXnr/HFy5Z+g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-qe010wIONDaN4gVXvjzk6A-1; Wed, 30 Oct 2024 06:16:19 -0400
X-MC-Unique: qe010wIONDaN4gVXvjzk6A-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4315f48bd70so41369595e9.2
        for <tools@linux.kernel.org>; Wed, 30 Oct 2024 03:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730283378; x=1730888178;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDwlDjJgaUUCtMK6klxf6nX5SB711o9drk3vSTq4f9Q=;
        b=XFuNIu5va05v5KH4dejfukRWVGqLby2NRWG1kVL2fPs2J04HtvhXsRdQftgzUhADgD
         q0EJZgT4IF9NuTP/8XMrYo53CMT/YwUqRdIwW+ztyG2+Ry7Q5UZ57OIEO85uSNLcPbfZ
         BbFoK55dfBb7Ve1YNMZ+PwQdDb4lllvPL0AIy5PdaJcRKLPnLMkyoLiXlrLehIxTIZud
         Xk+KKLqFdxPvz5/5mgq+RVD+ZbA8ISvAxjkbz1+LGuXp5lL35JU2PoTGDLErbyZgNV7i
         PoegSVrI7A2vB1V4/fqg3ArRTr1lpNjkR3mrV042E2/AOfgCfgHS9xSz73By2A51cDol
         ixjw==
X-Gm-Message-State: AOJu0YzqyTdyoUGt4uhjL9jWpin+4VBJ88Az8b7Ixi3DSne47FeKMuaT
	eA6ouCkS2KTLJIHfGHiSoHf3jrYx5ZQFtmK3Egwj4FG3QGXQEBX2qNJnrzPvZlyfRQZJ7ldIX9v
	5WhSalCg3TfqgMKz/F2LrdY/Nx1aa/gLFHNh0fCNzNdy7wteew0xtbhXh3WGVwgSXt4xkWruT3L
	GhxxNgScMbLoVL1L1J9ul/KrUy1qpVazYR
X-Received: by 2002:a05:600c:3b94:b0:431:4e3f:9dee with SMTP id 5b1f17b1804b1-4319ac7409amr114839825e9.4.1730283378148;
        Wed, 30 Oct 2024 03:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvU25uT+brDhcoJ4vxv4pIS5kHMqBO4tvt27JBqUcKaj5t7IJOPQW2Ut7NpyWlHd8tVpVe5g==
X-Received: by 2002:a05:600c:3b94:b0:431:4e3f:9dee with SMTP id 5b1f17b1804b1-4319ac7409amr114839585e9.4.1730283377734;
        Wed, 30 Oct 2024 03:16:17 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca6f8sm16639995e9.39.2024.10.30.03.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 03:16:17 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 477F1164B372; Wed, 30 Oct 2024 11:16:15 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 feature request: run command before rewriting history
In-Reply-To: <87ttdkrylx.fsf@toke.dk>
References: <87ttdkrylx.fsf@toke.dk>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 30 Oct 2024 11:16:15 +0100
Message-ID: <87ttctc2vk.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com> writes:

> Hi Konstantin
>
> I recently started switching my workflow over to 'b4 prep' for preparing
> patches, and am loving the workflow. Thanks a lot for working on this!
>
> However, I ran into one little snag, that I'm hoping could be fixed with
> a new b4 feature: I am also a big fan of 'stacked git' (stgit)[0], and
> often use that instead of 'rebase -i' when preparing a series for
> submission.
>
> So naturally, I want to combine 'b4 prep' with stgit. The problem here
> is that stgit maintains its own state for the branches it manages, and
> gets awfully confused if the git history is rewritten underneath it.
> It's still possible to use it with 'b4 prep', as long as I remember to
> do 'stg commit --all' before running any of the b4 commands. And, well,
> guess what I already forgot several times? :)
>
> So, my feature request is this: add support to b4 for a hook command
> that is executed before any operation that will rewrite history - and
> abort the rewriting if the command fails. That way, I can make sure that
> I don't forget to clear the stgit state before running b4, saving me
> from the pain of dealing with a confused tool.
>
> Do you think this would be feasible to implement?

Hi Konstantin

Friendly ping on the above? :)

-Toke

