Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DB38F42
	for <tools@linux.kernel.org>; Fri,  3 Mar 2023 20:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813A0C433D2;
	Fri,  3 Mar 2023 20:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677874179;
	bh=jwgvcOGxfPSjDHCHGWxezaW4bbv9GzNR/YGyJU2uTe4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=QLzIvwglqea9rY6DTHlcxIYRNjM2A6rOMhpowGdDX2624XgSOciYVxEe0jiSnejo0
	 HYMYaTGMccI8zECkY8vyRjU0dGxNPnehjJ4dcyFC2ujY6KtbWJkSgqO97K8xUOEAHU
	 kj0WUW+BS6ivvXJ7IdJFNfV0L4ppe5sGh+H9b1bs=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
In-Reply-To: <20230217-resend-auto-version-v2-1-0830b9733993@t-8ch.de>
References: <20230217-resend-auto-version-v2-1-0830b9733993@t-8ch.de>
Subject: Re: [PATCH b4 v2] ez: send: make argument to --resend optional
Message-Id: <167787417942.2022941.5847097192182014335.b4-ty@linuxfoundation.org>
Date: Fri, 03 Mar 2023 15:09:39 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-888c7


On Fri, 17 Feb 2023 03:58:58 +0000, Thomas Weißschuh wrote:
> This frees the user from having to specifying an explicit version to
> resend.
> Most of the time this should be the latest version.
> 
> 

Applied, thanks!

[1/1] ez: send: make argument to --resend optional
      commit: b67cc9871268bf44476e91f14eeca8d9889f5e2d

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

