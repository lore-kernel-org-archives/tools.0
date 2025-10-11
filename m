Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E211DE2D8
	for <tools@linux.kernel.org>; Sat, 11 Oct 2025 06:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760164438; cv=none; b=ec3MJDnfxW2CyPc/RC03sDhdVTIMIBQJnC2RYBARffdtpycOnteMr+Ow0LneWNJ0ukQft7pMMRNXMcUzDwbIhI8byZkknDaM4F1D59v3aTNwFeVg6dIx2G34J17Ln2YEOc7gCMlxjkeBr5/xOtvOorypAwCM4FHmax2+W2udBw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760164438; c=relaxed/simple;
	bh=dPoW0RbVZdZp72dqq2CElOPyzrmr9dcdtAz3enxXbXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ge7J3ETmT7tp7OVKGLGy653bMAjd6kXv3kk58ES4rZIMwANedGHiKbjwCXTVl7LvjbFBKOHsF4Udmk4HgBBlC4I0ECmaif+m0zADDFsohob149Igo2exhDsISWZ0SMsby7zGoobXWc7XrctsIDXtMnOXG6my8SKLOTfuNgPw7gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QOZWqg/f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QOZWqg/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760164435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YIYKLLPvcsDuKULYUL3h5zIyFH0TQ7wGDt8RxF6xQUk=;
	b=QOZWqg/f6FRhlXxv/a3CwCEal5DhiY4mOtbegrHtRLdzqO+U1MaP9lsCF06Phg4jGQfrQl
	lwGN9fheLkDhdlDEUQrUb63c7RFJ9sKl7SZVZrJExhAPzqe7Zf05OOwAFgf2wwNuiXuhLO
	EQOt9CCf4EhbQZ7Zfw8NHNZ68f7Jh4M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-wjZ8YRO0M0yT6jLG6KNPeQ-1; Sat, 11 Oct 2025 02:33:54 -0400
X-MC-Unique: wjZ8YRO0M0yT6jLG6KNPeQ-1
X-Mimecast-MFC-AGG-ID: wjZ8YRO0M0yT6jLG6KNPeQ_1760164433
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3f924ae2a89so3283444f8f.3
        for <tools@linux.kernel.org>; Fri, 10 Oct 2025 23:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760164433; x=1760769233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIYKLLPvcsDuKULYUL3h5zIyFH0TQ7wGDt8RxF6xQUk=;
        b=sAId+UFDrR1+cX50R+BMPWR1by2GdVgk/aoHjUqzT5t8KrYPpOgvC/9cJImpTX613N
         3/qMkdmdOfdJcDHDWLJBZfONRtM0aWHnS9aR5HCcGDvGwCyCeK/aQ07qdpGiErIoEY1r
         S6H2W/IgKXHqrXJfWxcVrQC2NUsPHYIL29JG5X9xg9i2ZnzKFva3NlIio6zLisGl5P9R
         cmSkW3khh79Djw+XFHAZW+EvKvojkfx5pw0DKt0yH9riYz/TmQk8O8WkrXgdwSP2L5Fr
         9vlTo7Is04ItRl8njLa2j6T8gN+bqgsDD4J8I37IIOSMSW6YG9JVx8DFV3fUDDbVxl8d
         H2jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsYafUrixDGN8LJLUWwE1LgHBo9A/tUOrfWWBZGLix69Wv9iwS01kpLtcACU4ZICS/E2j3sQ==@linux.kernel.org
X-Gm-Message-State: AOJu0Yw1pAWtt9sxhbAjnlew2Ozr9ilDOglWR2CrHyCkW1eVq0QmgsSJ
	8CFNWAa4t1TC0sQawG987+Ewy5wTDgU3oCxeF7p8YA8VcbP+utAZY9i8i47EwqwgQCWHLvxIH90
	6f6gXRDkQ8FMvhWkH+mBpPKUH5+7eX0JYIMvIr3dAfsUyGk9/9c+mFVCWdOWyn14TeZNTdw5Lxa
	UbRWePcWySmRga3duCsu286OQTeYVoReAh
X-Gm-Gg: ASbGncsJieYY93au/VniIsW3suMQh5BY/XoIcYO/vCC+vjHyjN/4JbrD9QboFtXFV24
	osO5egWu/JBSkuBMdx4i9PUUriD6n+tJDgxEyXTZ+c3RArjLbYKCoOAGNEmAuw7/sUt/YXQ7swU
	pNXHLjtzwIpkEgsPlx2WkGKpw3KTmA5jgBgRu9vYuTcQVUK0eR7783OUjvIYNdw5WlCVmBnHyYY
	ntOCihrDmsNCxHYJ/Kq3Ns6cg==
X-Received: by 2002:a5d:588a:0:b0:3ec:4e41:fd86 with SMTP id ffacd0b85a97d-4267260e213mr8507388f8f.50.1760164433183;
        Fri, 10 Oct 2025 23:33:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEpLO6OYXUE1/ArR9vy36CZE48E1R37f+11NGgWeETWW42Df2ABAL4IQjgp34ldNMf/7HIoQS6sm4JgDZIopo=
X-Received: by 2002:a5d:588a:0:b0:3ec:4e41:fd86 with SMTP id
 ffacd0b85a97d-4267260e213mr8507377f8f.50.1760164432812; Fri, 10 Oct 2025
 23:33:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu>
In-Reply-To: <20251011061351.GB23024@1wt.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 11 Oct 2025 08:33:41 +0200
X-Gm-Features: AS18NWDsAc3i-nSNvVaeet-T2NsIH4l2mfD1guzxsrfi1JKYIBDdXLmn3IaYZFc
Message-ID: <CABgObfbCLK9aEVg=y_fG8EfN3Q_f=LnGMjCPz+yWU-FS5-6V4Q@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Willy Tarreau <w@1wt.eu>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, 
	tools@linux.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EftUTdK2ISWWTC8z7FMTrXKElThj4yfe92i7J3iBvfY_1760164433
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 11, 2025 at 8:20=E2=80=AFAM Willy Tarreau <w@1wt.eu> wrote:
>
> On Sat, Oct 11, 2025 at 07:59:32AM +0200, Paolo Bonzini wrote:
> > [1] "git am" adding Message-Id predates Link as far as I know. It's
> > less handy than a clickable link, but again the known format used by
> > git send-email comes to help. I have configured my terminal so that
> > "email addresses" starting with "20" open in lore rather than as
> > mailto URLs. :))
>
> Maybe what would be needed would be a "Lore" (or "Series" or "Discussion"=
)
> trailer that automatically makes a lore link from the message-id, and
> which would explicitly indicate that there's nothing else there but the
> actual patch submission, contrary to Link that's for any extra info ?
> It would be added by "git am" when passed a specific option.

And if no one has a problem with s/Link/Lore/, who am I to complain!
With -m (or the am.messageid config) I have in the applypatch-msg hook

sed -i \
  -e 's,^Message-I[Dd]: <\(.*\)>$,Link: https://lore.kernel.org/r/\1,' \
  "$1"

and it's an easy replacement to change the name of the trailer.
Likewise b4 could do it.

Paolo

