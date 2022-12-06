Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A195695
	for <tools@linux.kernel.org>; Tue,  6 Dec 2022 22:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A0FC433C1;
	Tue,  6 Dec 2022 22:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670366700;
	bh=vH5FcWXC2kP13vhDVYbb4A1g2bfB5esVOz3R/1Lf4EY=;
	h=Subject:From:To:Cc:Date:From;
	b=o4k3QwYMSscxSMpay/bWEahTMABDTklCHbwDQI2uG7LbTJ4vNda9r+sdS0ZIaJhaj
	 MPBYcCPqHDLsYCyhYpJyJbeQeo9atsE3MvlIZPjVZzmB3r0FOO82zkd3afgPq8Y8bd
	 b8jnt1xHwrrDLnutGX9jZXh4FxWc94zsIWfP/lUJRjigSI8ZfHa5xKhFXDklTzlOM2
	 ha9JhRQApl0sfTxEbot/PM7LZHsz4kPbPEHGI3OGHPf9UaGRzFZ2dMzIZ6d6K2GqSI
	 P14dNNcbgZPiHN6aJpvg5unOxb1Kpr/wrYpDaz0G+s3aUVINCHnpt2gziF6lNADWMR
	 +Z0ApfWoRwpwQ==
Message-ID: <a68d5dc1c7919b16062fa1c477cf12b5c924caa7.camel@kernel.org>
Subject: b4 prep + prefix handling
From: Vishal Verma <vishal@kernel.org>
To: tools@linux.kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Tue, 06 Dec 2022 15:44:59 -0700
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0

Hi Konstantin,

I found a possible issue with prefixes - and also a suggestion below:

- When a 'git config format.subjectprefix' exists, b4 send does
something unexpected:
(the .git/config subjectprefix here was "ndctl PATCH")

  | Subject: [PATCH 2/2] [ndctl PATCH] meson.build: add a check argument to=
 run_command

- It might be helpful to configure whether the final form is "PATCH
prefix" vs "prefix PATCH". I'm used to the latter, but I don't know if
the former is considered conventional.

- It might be nice if prefixes from git-config could be added
automagically (perhaps b4 prep pulls these in when starting a new
set?). I have prefixes based on repos sometimes, like the above
example, and it would be nice to get consistent behavior regardless of
whether 'b4 prep/send' is used or 'git format-patch/send-email'

Thanks!
Vishal
