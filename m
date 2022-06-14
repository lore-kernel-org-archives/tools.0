Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CF12567;
	Tue, 14 Jun 2022 22:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6BCC3411E;
	Tue, 14 Jun 2022 22:21:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="X5862caP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1655245270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nJPhx5+7E0SoVp5oXOR+cRvkRuj5Z5ej0pZrfUNHzDQ=;
	b=X5862caPT2CRbqUAYufkUkWsoePfjVE7FAGRH35FcycqwsIcMjxueuLsnyz5FCLYO3hSD8
	GKPczzuoOC/BRZ2uPlR6uaC2jmYtRtcIz77yD/W5CmHZumRIv8fT9ZxOESld7vT/Ft4NWf
	8dQaObgEiD9hLZUlJ1rmPqrL5mOI8KU=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b3739509 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Tue, 14 Jun 2022 22:21:10 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-3137316bb69so43847747b3.10;
        Tue, 14 Jun 2022 15:21:10 -0700 (PDT)
X-Gm-Message-State: AJIora+GPYJlYeWLZymrLStoq95iutwYHr0YR+igidewN2xUAiIoPfE0
	K3p/jlWYTpU6CQiH9E+QvezQgdKK9PDtAcwhr0w=
X-Google-Smtp-Source: AGRyM1tCbcrczWR79wye2Un9a93EiYVB8+ZRWXnrOGGZVjta1JWKzSakU1lrI3UNOSs8C0y6fQ95H/2sCkAjiL5yi6o=
X-Received: by 2002:a81:4887:0:b0:30c:40bd:3e7b with SMTP id
 v129-20020a814887000000b0030c40bd3e7bmr8427606ywa.396.1655245269673; Tue, 14
 Jun 2022 15:21:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Received: by 2002:a05:7110:6407:b0:181:6914:78f6 with HTTP; Tue, 14 Jun 2022
 15:21:08 -0700 (PDT)
In-Reply-To: <20220614213955.eyex4bekp44iroud@meerkat.local>
References: <20220614213955.eyex4bekp44iroud@meerkat.local>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 15 Jun 2022 00:21:08 +0200
X-Gmail-Original-Message-ID: <CAHmME9p9CA+i-y7wiPYUxXJ7nOqH5V+1cEJ75Js_=PUB99=m+A@mail.gmail.com>
Message-ID: <CAHmME9p9CA+i-y7wiPYUxXJ7nOqH5V+1cEJ75Js_=PUB99=m+A@mail.gmail.com>
Subject: Re: b4 Link: trailer disambiguation poll
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

The option I don't see in the poll just not automatically adding any
Link trailer, and leaving that up to humans to decide a relevant link
exists vs not.

Jason
