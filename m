Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB23F10782
	for <tools@linux.kernel.org>; Thu,  1 Dec 2022 21:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372C8C433C1;
	Thu,  1 Dec 2022 21:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669929844;
	bh=CK7mfrWBzJdhcXLBW8YwcjaTi88W6W+QGlW8h4XjlIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TpOpuCwRMqkYiDdw1ONqlQPE7z7o1wsnio2bbgN6g2ncr4W46y4lZ9N8z5fE39KNL
	 isxLA4r7sSVs+uVKPRnUYqBouaC7wsMtcIHnYCF453Tht9SSgSKWNCEb1R1syTt5bt
	 4RvOzUkVO0nI0M1q16La71MdJJ7Iwycy6VPhnDAc=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, Douglas Anderson <dianders@chromium.org>
Cc: Kees Cook <keescook@chromium.org>
In-Reply-To: <20221201152814.1381855-1-dianders@chromium.org>
References: <20221201152814.1381855-1-dianders@chromium.org>
Subject: Re: [PATCH] b4: patatt: Update patatt from 0.6.0 => 0.6.2
Message-Id:
 <166992984411.721094.15628658944772061324.b4-ty@linuxfoundation.org>
Date: Thu, 01 Dec 2022 16:24:04 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-50ba3


On Thu, 01 Dec 2022 07:28:14 -0800, Douglas Anderson wrote:
> As of commit 3847a92a365a ("validate: Use patatt's configured keyring
> as fallback"), you can see that we call patatt.get_config_from_git()
> in some cases. The patatt module doesn't have get_config_from_git() as
> of 0.6.0. Update to 0.6.2, the newest version.
> 
> 

Applied, thanks!

[1/1] b4: patatt: Update patatt from 0.6.0 => 0.6.2
      commit: 50ba3cc3da02fcccef71fe936e0cc4dd110c0673

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
