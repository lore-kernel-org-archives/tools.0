Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38AB1F16A
	for <tools@linux.kernel.org>; Thu, 22 Jun 2023 17:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8141AC433C0;
	Thu, 22 Jun 2023 17:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687456057;
	bh=oZcnh/BjzfmquO8ipnqXSTCoAs5+xGeNdM4m+DWj9SM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=SL+zRpOCeBlUUo4dM4QbX2et4xAHgY4crKXDSMF5UqF5p6f7+iwrtuU7L1oYkv8Mw
	 SsPKnyttXHwj7EVH5HwqdjfB/io0WCPXy/jDjSVrNt/4e6Yvt/Saio4a4xPamRn1Pj
	 MDmjuow+IQNCvWJ2ofRdzKlI5LlEua/ktUKV+XEhPJ9Wf8tBLy2xdo1QcXKSRo+PoG
	 QYTdwt4xeW+ny65Hx/KmXzMwx/KmUIXAgdFTQ4DAYopjKoYyr9Z4sEGtA1qAIG7b76
	 wOwJKl0+nLFQ+hAAHJHAKgu8OBortg0SDsgJbRZMi5vH+yhRyVELFykQxGnmMZWHIi
	 ssc+hppOD7XRA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65A41C395FF;
	Thu, 22 Jun 2023 17:47:37 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@linux.kernel.org, erik.schilling@linaro.org, 
 konstantin@linuxfoundation.org
Message-ID: <20230622-b217563c3-c40bbba298ad@bugzilla.kernel.org>
In-Reply-To: <CTDYR84I395O.2UI69IKNO7B8A@fedora>
References: <CTDYR84I395O.2UI69IKNO7B8A@fedora>
Subject: Re: encoding issues with single-patch series
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu, 22 Jun 2023 17:47:37 +0000 (UTC)

Konstantin Ryabitsev writes in commit cee377e23203fd12590316c96ceadae8357e7a77:

Fix wrong CTR header after 8bit cover content is mixed in

When we mix in cover content into the patch that previously only had
7bit data, re-check the new payload and set C-T-R to 8bit if the new
payload is no longer ascii.

Reported-by: Erik Schilling <erik.schilling@linaro.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217563
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=cee377e23203)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

