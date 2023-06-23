Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464D3100BC
	for <tools@linux.kernel.org>; Fri, 23 Jun 2023 17:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAF46C433C9;
	Fri, 23 Jun 2023 17:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687540518;
	bh=fUx0xKoo5vDrDPZ4lR/PB5A4Os03tQVedro3+Kjd/0E=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=FsXbvrrHAHCv4FQP7rNRX4XDPHo63e6XUP8HLA6dS4x4J+GFrBbU77WrqioAEjU39
	 u5dF5bqqy+aYce2CEB5h9QLbHTmfbjy3ZtnIJxBXnssptCECvr4xJmCgo10nzOXt5L
	 SGsA9LmlywefWkEnHvJWC4qQDK83sR0TeWj1ELUxDjDmCQpPCr8ve2rmi74ovHsEkG
	 nBnUL/x3QwNmAP2iuYWabUJ2D9bA+9MmFmPlRsOwIAvgjJGYes/A0r/nrvRMDOxiBe
	 EmYOTzaJlnGkEgErDXrPPmbJxZylFJWBHzFCUfbE6LGoqtjgY1Cb7o8hBIKoTyfZPn
	 dK3XjuAmHCXbw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C5D3C43169;
	Fri, 23 Jun 2023 17:15:18 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: erik.schilling@linaro.org, konstantin@linuxfoundation.org, 
 tools@linux.kernel.org
Message-ID: <20230623-b217564c2-53d1aaacc7ed@bugzilla.kernel.org>
In-Reply-To: <CTDVYQ01B09D.1FUED4Y6IQUKI@fedora>
References: <CTDVYQ01B09D.1FUED4Y6IQUKI@fedora>
Subject: Re: resending drops previously configured prefixes
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Fri, 23 Jun 2023 17:15:18 +0000 (UTC)

Konstantin Ryabitsev writes in commit 099c9b47b39b6076752b8c757872080fad8fae56:

ez: store sent prefixes with the tag message

For resend purposes, we need to store the prefixes that were used for
sending that series at the time. This way when --resend is used, we can
restore the subject line to what it was at the time.

Reported-by: Erik Schilling <erik.schilling@linaro.org>
Link: https://msgid.link/CTDVYQ01B09D.1FUED4Y6IQUKI@fedora
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217564
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=099c9b47b39b)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

