Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C408F42
	for <tools@linux.kernel.org>; Fri,  3 Mar 2023 20:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8881FC4339C;
	Fri,  3 Mar 2023 20:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677873619;
	bh=FPEsNSvd94TTrF9d7y7iGV6G1Wt4m8JLFZPOgND6/H0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ninHLGzP4oQDwQ9Q++T9SIbvzPLLGmA7XNcv1Br6VGsB9Ddevx3t2fB4kUeLN5Oay
	 Vpewa5ft7kchJdLyb2yUHR/TFDj1FRWVO7Tuz3LstcxMohMAQsU7gHPZbsdNLm+NgK
	 afFsSF1mmJnGJSKa85r8tDmyt+WGtj+0bZ9IrVjE=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
In-Reply-To: <20230221-fix-base-commit-for-non-commit-strategies-v1-1-0e31f1333d76@gmail.com>
References: <20230221-fix-base-commit-for-non-commit-strategies-v1-1-0e31f1333d76@gmail.com>
Subject: Re: [PATCH b4] ez: get_series_details: correctly compute
 'base_commit' for all strategies
Message-Id: <167787361933.2020772.369960321763847839.b4-ty@linuxfoundation.org>
Date: Fri, 03 Mar 2023 15:00:19 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-221cc


On Tue, 21 Feb 2023 20:07:46 -0500, Philippe Blain wrote:
> In f0fad6e (ez: refactor based on initial feedback, 2022-07-20), support
> was added for the 'branch-description' strategy, but
> 'get_series_details' was not changed to account for the fact that if the
> cover letter is stored in the branch description, base_commit and
> start_commit should be the same commit.
> 
> This was also missed when 9e95d52 (ez: implement tip-commit strategy,
> 2022-07-27) added support for the 'tip-commit' strategy and changed
> get_series_details to adjust the end commit of the series.
> 
> [...]

Applied, thanks!

[1/1] ez: get_series_details: correctly compute 'base_commit' for all strategies
      commit: 221cc6ccd40d3e643bc65b34f2fca72ad2a69363

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

