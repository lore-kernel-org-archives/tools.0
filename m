Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2260D1E536;
	Thu, 13 Jul 2023 20:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78328C433C8;
	Thu, 13 Jul 2023 20:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689281927;
	bh=OKc7djVGC1G0iNASdLOv5xmkWlnUCpLAacCVrmswCcc=;
	h=Reply-To:From:Date:Subject:To:From;
	b=UGB6K47Pc8onFcIHFT995NaanTd76MD3Q5X2QEOP5eF5GyZHPvsFccRVqBo+9MgJa
	 cYVx82taH87uw59Pzk0/XagDNCGuxhi8APVvueJC472KBQUuBFqjdLd/9TlnOFgJdp
	 bDf5+HZ0tjo8dW1ZZ+PxKn5NTYRLiyBBiveRuiZaNlO5vK+FeUz3B7zC/aqHXmJY3U
	 pPF21EEwDOP4Na1+89VlU5lfdUP7BUclTjc7YIkKPkOGg7GxMpsBbJnUzRHNEzCL71
	 hsJEH7KlBNkEbGmPE2OUReXdcQ2O5HuSvFSmSs6Asmzz7XttgOvCUc52oZTyY81Bar
	 rGtdrya44bFQg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51e619bcbf9so1535399a12.3;
        Thu, 13 Jul 2023 13:58:47 -0700 (PDT)
X-Gm-Message-State: ABy/qLZReTF4xpVbkY6+Kl4lPOWToPKkT1c/BABS0w1YY/iRKip/SUeO
	5hgGpD4KFNRvl7ydCM7z1wxXGf6XVvdApY2Bh+A=
X-Google-Smtp-Source: APBJJlG2vYyE7gHOIROhgvkLyuX8lrlrmIOIXQDau8rXfKEQV8VnrZxhuV5K1jX1TtBTrXl7TEl7qGbAI2V0xkg7aNM=
X-Received: by 2002:a05:6402:7cb:b0:51d:9db8:8257 with SMTP id
 u11-20020a05640207cb00b0051d9db88257mr3189753edy.30.1689281925654; Thu, 13
 Jul 2023 13:58:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Reply-To: lee@kernel.org
From: Lee Jones <lee@kernel.org>
Date: Thu, 13 Jul 2023 21:58:34 +0100
X-Gmail-Original-Message-ID: <CABVG=qdHsB5pa8rOKCV9s2WtXKZ-Qh1+8q=1VNcorM37P4r1EQ@mail.gmail.com>
Message-ID: <CABVG=qdHsB5pa8rOKCV9s2WtXKZ-Qh1+8q=1VNcorM37P4r1EQ@mail.gmail.com>
Subject: b4: ty: Feature request - configuration option to send to 'myemail'
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good evening Konstantin,

I notice that `b4 ty` forcibly scrubs 'myemail' from the recipients list [0=
].

Is there a good way to ensure `b4 ty`s reply ends up in my Mutt based inbox=
?

If not already possible, would it be plausible to prevent the
scrubbing?  Perhaps behind a config option?

Thanks for you consideration.

Kind regards,
Lee

[0] https://github.com/mricon/b4/blob/099c9b47b39b6076752b8c757872080fad8fa=
e56/b4/ty.py#L84C28-L84C35

--=20
Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
