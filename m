Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718B415BD
	for <tools@linux.kernel.org>; Fri, 26 May 2023 17:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF647C433EF;
	Fri, 26 May 2023 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685123247;
	bh=o9h+AeG6jjns140uX/vHSGURpRODszT26ZmIr6vV76A=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=BKQsxBKwHPmGI2VXrmzfwH6yfp4/7ZjefJfp0fkerUCJ/zbsdZCFrs2ATFEoeJOPq
	 jzr4quTMCSA+hSoMmmcoELBl9FbFL8JPNcWVoQN5HDsJK5RpaIJ+J9Gh5PakjnSaVN
	 c0DkQg+b4p+pJJRdU3P2by2PkGvOdQqRfLjgkBsk=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>, 
 Erik Schilling <erik.schilling@linaro.org>
In-Reply-To: <20230523-fix-smpt-port-config-v1-1-cdc99e39b866@linaro.org>
References: <20230523-fix-smpt-port-config-v1-1-cdc99e39b866@linaro.org>
Subject: Re: [PATCH b4] docs: fix smtpServerPort option
Message-Id: <168512324681.1381933.12994418657019755055.b4-ty@linuxfoundation.org>
Date: Fri, 26 May 2023 13:47:26 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-b5397


On Tue, 23 May 2023 12:44:17 +0200, Erik Schilling wrote:
> The right name includes a "Server".
> 
> 

Applied, thanks!

[1/1] docs: fix smtpServerPort option
      commit: b53970ae7fde72d27f6c8caed0dbd10597eb7fba

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

