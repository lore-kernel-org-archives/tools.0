Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85428F47
	for <tools@linux.kernel.org>; Wed,  2 Aug 2023 16:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20407C433C7;
	Wed,  2 Aug 2023 16:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690992473;
	bh=RX/EVx2agbtpxus+efWxFPHD+yK/39ZTmD0r4M4mIjA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=M1a+/DhpubBRW2XPBIKm+TQYlS78/0doRjwn2rl3lhmsJ3kM3lhkWIUlRVgP1XURo
	 U5QPYSgmwx93Tf3+7L7jwOrSWKu6JhoQbenxbS69f5hWLsqQwVrXGxnyVwUno4qEYB
	 3P8UZjXyEcjbzapZUDbNkV4AphF8krPek+++pQA0=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>, 
 Joel Granados <j.granados@samsung.com>
In-Reply-To: <20230802-jag-add_web_switch-v2-1-2e789cf3e0a0@samsung.com>
References: <20230802-jag-add_web_switch-v2-1-2e789cf3e0a0@samsung.com>
Subject: Re: [PATCH b4 v2] ez: Add --use-web-endpoint arg to force web
 endpoint
Message-Id: <169099247302.863246.14321219097766167790.b4-ty@linuxfoundation.org>
Date: Wed, 02 Aug 2023 12:07:53 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-e8045


On Wed, 02 Aug 2023 09:39:41 +0200, Joel Granados wrote:
> Make it easier to prefer going through the web endpoint by adding an
> argument that will force this path. This is for users that want to use
> B4 for preparing and sharing patchsets over mail and need an argument to
> activate the web endpoint whenever needed, but want to default to smtp
> server for the rest.
> 
> 
> [...]

Applied, thanks!

[1/1] ez: Add --use-web-endpoint arg to force web endpoint
      commit: e8045d1353165cc065b2f1b180bf1b0846af510e

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

