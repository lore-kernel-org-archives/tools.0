Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE885CA8;
	Mon, 29 Aug 2022 21:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B743C43155;
	Mon, 29 Aug 2022 21:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1661807273;
	bh=AsIt6zA/7zquze8fasYzE/gwKvbTPRWUILRxc8c3GuI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jqoZZJfmogr1VzMey6JpurJ/mgFcMV90vJSt6lsCAMQ9/lNXPVIe8RHrA7Ta8cj/x
	 wJ3DQjjGc8/2e/m3Ke8YqdWR8YX5cmdj0xm3ZFunZE4IIDuFJyFKVo6E1Dv1BxpGMB
	 zwto4EDmvlfpzzed/x8qFIjEkBMzR5dPqqSJY4FU=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, Rob Herring <robh@kernel.org>
Cc: users@linux.kernel.org
In-Reply-To: <20220825182519.1449744-1-robh@kernel.org>
References: <20220825182519.1449744-1-robh@kernel.org>
Subject: Re: [PATCH] ez: Fix adding 'RESEND' to patch subject
Message-Id: <166180727314.1616213.16048046926079938192.b4-ty@linuxfoundation.org>
Date: Mon, 29 Aug 2022 17:07:53 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-bf857

On Thu, 25 Aug 2022 13:25:19 -0500, Rob Herring wrote:
> If --resend option is given, the 'RESEND' prefix is not added to the patch
> subject(s). This is because the original command line prefix list is
> passed rather than the modified prefix list.
> 
> 

Applied, thanks!

[1/1] ez: Fix adding 'RESEND' to patch subject
      commit: 2d2c86e713fb523e7a17c3d343a7c8bf68cf4a53

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
