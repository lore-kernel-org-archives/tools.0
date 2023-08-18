Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6DF2C9A
	for <tools@linux.kernel.org>; Fri, 18 Aug 2023 21:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECD0C433C9
	for <tools@linux.kernel.org>; Fri, 18 Aug 2023 21:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692393044;
	bh=LOnZwFV/Kmnhv4PI8gfdEK1KeNn8lTYHa1mucEDSs8I=;
	h=From:Date:Subject:To:From;
	b=YFTgCVYdG+XYip9P2PkO4WdeIEH+TxXXjc5AeniajQHsWLd25kICK7mT2pXy92+x/
	 yOsj2h9eVMu+iTwsFb4hU3x8xOj8+NkcmSpYUicmvCHqAVeyxpgOkSTpwq/d/DLJsS
	 5Uv2GemsqO0AyVJ8enlNkUFcFkdTSOHo7v4krbyHQ9YUI7lEgilcQnw0/sX9rX6Lej
	 n6SXNFNtDDMrwkyeX8ZnJOikvzJDG6scVaO4Le8i+cuzGuFROrzdstRBNYS9LrHxqx
	 nLVwdm71ijgDk8cUM1SbqSy4UaikTwRsvZKE0X+2Ch5f4nSh3TwnfQHaI4FRaiKMVZ
	 JMrNW87WdjOig==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4ff8cf11b90so2031589e87.1
        for <tools@linux.kernel.org>; Fri, 18 Aug 2023 14:10:44 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx3uMbE0kTw32a/BcGr3q1+EHAKVe/0/E9PLcg2HQCu+jVhc48N
	zJ+uqrdbokhj7GlvOTb4JjykpQHt3O7C06Liftg=
X-Google-Smtp-Source: AGHT+IGH0JpZTmHgNcTfpZZfZsufaS9VzI3YDNTJL6JD/W5vt462BFANFmKBvdWX8n2cFkKYCi/sqnbJ20dnl6T/JpY=
X-Received: by 2002:a05:6512:3ca9:b0:4fd:fadc:f1e with SMTP id
 h41-20020a0565123ca900b004fdfadc0f1emr223955lfv.44.1692393042766; Fri, 18 Aug
 2023 14:10:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Song Liu <song@kernel.org>
Date: Fri, 18 Aug 2023 14:10:30 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5Fqv7g=AVCGgQtFotG1oaUO+j5qBEyoTWJy0=n0mJS8w@mail.gmail.com>
Message-ID: <CAPhsuW5Fqv7g=AVCGgQtFotG1oaUO+j5qBEyoTWJy0=n0mJS8w@mail.gmail.com>
Subject: feature request: b4 am verifies SHA1 from the Fixes tag exists in
 current branch
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi folks,

I recently made a mistake with a patch that contains wrong Fixes tag:

https://lore.kernel.org/lkml/20230815091931.4dd2b277@canb.auug.org.au/

Some lore search shows this is kinda a common mistake:
