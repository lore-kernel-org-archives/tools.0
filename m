Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C5C299952
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 14:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539364; cv=none; b=OiowXqmCEZDY/s7W+45m3jS+4L/6q0J+SdE8fWy6I0ATup9SceoR1c/iyKublxUC/2Vcz/2niLrYckXrdBFZzajeGjQGvZ2umM9m7uZW1HBmaKwqeDYLxA80fO0nuhZbKULNbTQiB5rz7jgNuW03k+f5bu6S/vpVZ+y/77eS420=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539364; c=relaxed/simple;
	bh=UMaiVk1DdP1mDUMMbx1VwfmD/YAP/UXqRqFwQ8Smx6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8xsLGGWNXryHRxlzb3MsdpCDgxPCSLZa0qcgGbFPw6swBEKzKk2ZOq1RmWBGIy6GJMoyDIxujaxhGbm9WI9IisPvTz4E2/0iOwDl+wPgMTbUkjrzgqfBc5IxuNZEL55XofAwhhahY2WBxEx83V8jmRSWIMk+AVOlcnx+fUrj/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbwDsHGP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbwDsHGP"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2699ef1b4e3so13080575ad.0
        for <tools@linux.kernel.org>; Wed, 15 Oct 2025 07:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760539362; x=1761144162; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMaiVk1DdP1mDUMMbx1VwfmD/YAP/UXqRqFwQ8Smx6Y=;
        b=TbwDsHGP6xgAXnVJyk7we5FpYUQD7P1MgexaGllCsSTF0fatkXz8sVecPKV9wUnEu/
         wxi4CnHyZowWCTrlcMBM/RCBXyPdrptrkdse17kN1iZRMG2+kD+k6N0z4Su4fxPa78co
         3pIt2aZjwA7nk0chO7Q7YzsuD5cn6I0ANdXJDBFdb+klIxjgGiPh/9q7h9XecS9Se5AV
         aqpgIhZN0qsK4osGO4GpTnS9G+cG/0epMAfHRvOmzy1xWFDnKNz+zFLRLLA97BJ6PV4w
         hLCt19OoSlGaH9/zJwbDrWRoVwLcytOuOTsn1hqwuFN9UHFJYqZ15mymFeXcoa/gmTHn
         ltFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539362; x=1761144162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMaiVk1DdP1mDUMMbx1VwfmD/YAP/UXqRqFwQ8Smx6Y=;
        b=ZVNl+SJXl8+r1je0WGiArtDstxY9aZTGl/qlj27F1nJmLur+Rz7dCAQjtu4xC+bw9N
         OjFX8/yYSM1euOzafalGB8ZxbeZkJbrCGEPeVT8CiUEjKmgj/NEAbgM5pyRNotTzA95K
         UEpKEcywbrjl10CDIxoALSiRgQ7X8Atpts1A6lAgzd0InFWkXTTVVtLMsYb3sYpE/Snu
         cW7e2h7SGBxyLwFIIcT3ZIv0wl1TZsHnvUbWnooa2mE/QkJ6cf/OW0THwsfNxL80P6iz
         H750k6nnydUOUo4Kd7dMgPOIxPws3B5RACAUQg2s93JzYaCvBwnhAC1jayGbjPjQJSzo
         uFvA==
X-Forwarded-Encrypted: i=1; AJvYcCUqWaBpRtWWLX9aUgdPMq0MJInYNquurZpCtwZDwd1ncZgSuXF3PPVuxQ86nVtJgoQ3Essf7A==@linux.kernel.org
X-Gm-Message-State: AOJu0Ywrs8Y802NSK6CD5tz2Tog3bF4rkMUXzMRYm21N4YLszLbE9y5j
	3FfSXP8S79Sa6PkngnseJYm5vhfqqrfVwulXNFRMigdALAA/KDLrbN2EZTl6W8FnPFuiv3SCThx
	xm179yqlj6pm8gmocTxyICDn0xbMBPt8=
X-Gm-Gg: ASbGncs0n3t23hYG8kp0KmgnDpzaulND0eUEhNFlnoe9B45OzjrBmOeL1Icu+SKqYV0
	m6h+UCOHJ0jy/kPhecGGU/XjP1YdK90c1a0Q7UMAsku4rLxgSggC29f706xA1Lzh3RZY58RVHsq
	mcZJ9CZSoxDtrFuyN/G3B9kpOx3pxMznNTwqdqP6f5/w+RMS/VrmRoq6YJFdGA89eLalbysIpR5
	pLTrfrX7yib/nh502s1iI0rqfGsMiTD+cbDzWzd/rh9UcjmWDyts7Rc6ELt2Mvfn8KZk2sGXvwN
	RZkH+GN0dW4j4FpgEDZdKkZ6+jQcJtdfXqnqpG/5mkND
X-Google-Smtp-Source: AGHT+IGKCipssQn7VgnwY/vUr8mLF6u6zX3IbnsTUqOKvbDQ+scJj4BbQHlIm5Zee4UftTtvdYb1fJNK0cdp+vauhq8=
X-Received: by 2002:a17:902:f546:b0:274:944f:9d84 with SMTP id
 d9443c01a7336-29086b5593emr24587965ad.11.1760539361913; Wed, 15 Oct 2025
 07:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org> <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
 <yq1qzv49yb6.fsf@ca-mkp.ca.oracle.com> <20251015-zealous-debonair-bonobo-575799@lemur>
In-Reply-To: <20251015-zealous-debonair-bonobo-575799@lemur>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 15 Oct 2025 16:42:29 +0200
X-Gm-Features: AS18NWCXhK2O_kU3uRKbvpPuqRWDaifx0FrTYIJ2AtKCNBslLFrvmMbdZ6d0an8
Message-ID: <CANiq72nGULF6LpbaVDr_dp1soS3zumk0QtSDqj330XzMgEHYqg@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Linus Torvalds <torvalds@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, users@kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 4:16=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Do you normally edit them before applying, or after, when they are alread=
y
> applied to a tree?

In my case, always after applying. I mainly use `b4` to get patches
successfully applied (ideally in their original base if any), and then
everything else within Git, including rebasing them etc.

Modifying patches for small details is a fairly common operation to
do, especially in areas with new contributors. I add the square
brackets [ ... ] to explain the changes performed, and then submit a
message including the square brackets (that way e.g. a new contributor
knows what to do next time, without having yet another iteration of
the patch series).

Cheers,
Miguel
