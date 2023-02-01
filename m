Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8E4881D
	for <tools@linux.kernel.org>; Wed,  1 Feb 2023 20:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1120C433EF;
	Wed,  1 Feb 2023 20:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675283046;
	bh=wlC/5m7Rol/KJY2PEVX5eSVgLZh9/FhYklAym/JX+QA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=wdGYUMpMFCiMOvi1+NsUfGO4eXW/H2HeZTDAWph525o3iUTlMQlzx1OC2Bsiht8Wp
	 1gRV/x2Je5w0oOQIwUXV9pe6p+QfsEhLr83oZXgDwkUo7ktaEnruuGBy8ZhlNxVgBC
	 u5noQ7FQNy2oGcHOFz9718ksizI0jMKVNdvxUoug=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: palmer@dabbelt.com, Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, tools@linux.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20230201173301.54604-1-conor@kernel.org>
References: <20230201173301.54604-1-conor@kernel.org>
Subject: Re: [PATCH v2] shazam: Add the --merge-base argument
Message-Id: <167528304551.198624.16333876502009679581.b4-ty@linuxfoundation.org>
Date: Wed, 01 Feb 2023 15:24:05 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0


On Wed, 01 Feb 2023 17:33:02 +0000, Conor Dooley wrote:
> I was just handling a patch set where the author used English to
> describe the dependencies.  They hadn't yet been merged at the time the
> patch set was posted so I don't think there's really any way to make
> sure the computers always understand the base, this just lets me quickly
> override the automatic merge base detection when I run into something
> non-canonical.
> 
> [...]

Applied, thanks!

[1/1] shazam: Add the --merge-base argument
      commit: 7e797fe9e052bbc97f4ee2cf14b3c444c2d01653

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

