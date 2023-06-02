Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0FB19BDD
	for <tools@linux.kernel.org>; Fri,  2 Jun 2023 15:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACD6C433D2;
	Fri,  2 Jun 2023 15:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685720239;
	bh=iH5R23ksvBzCs3ZP/3kzaAXVljL9WRER6NHUHFfJ4g4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ajMoUXpYhh7D5eH7u7wTKI2RZcqEdw+OpSP8Nc9Mh/zxRKEjkDpTKhpR0OsBKIyx0
	 dBlH+/JKASDTkIv3LC3cUW26esqdd5iAyMk4BEJDXM8mMNJO/6wzlmBiYK1MvwsLc4
	 kdX+ZZJyWsFkfs7bj9xxGfXUCSEA2PKDeSbNJA0Y=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20230602152554.2046764-1-mripard@kernel.org>
References: <20230602152554.2046764-1-mripard@kernel.org>
Subject: Re: [PATCH] b4: Fix envelopeSender handling
Message-Id: <168572023878.3339676.12836077619762546849.b4-ty@linuxfoundation.org>
Date: Fri, 02 Jun 2023 11:37:18 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835


On Fri, 02 Jun 2023 17:25:54 +0200, Maxime Ripard wrote:
> The manpage for git-send-email states that:
> 
>   Specify the envelope sender used to send the emails. This is useful if
>   your default address is not the address that is subscribed to a list. In
>   order to use the From address, set the value to "auto". If you use the
>   sendmail binary, you must have suitable privileges for the -f parameter.
>   Default is the value of the sendemail.envelopeSender configuration
>   variable; if that is unspecified, choosing the envelope sender is left to
>   your MTA.
> 
> [...]

Applied, thanks!

[1/1] b4: Fix envelopeSender handling
      commit: c6835b7538331fc84b3743f57812181acd71dab6

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

