Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699793236
	for <tools@linux.kernel.org>; Wed, 19 Apr 2023 18:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E5DCC433EF;
	Wed, 19 Apr 2023 18:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681929088;
	bh=tQrs/ZLSVNPpa7GeGRxB1IyMsWbkoMQQXlY8feJhdUk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=otNsKfmRvUB4soZN/RLKsFeHjUO3grnroa69h6y5fdjpVil/+12uDKT8+YiiBpVUY
	 8Ia1BF7XCOGet80UIqcH8FRlBkPTu3bLbMf214rskFhTpgn2isxxcXhu5gru83WyO9
	 424f4dkgvnNJfXYSX1j2QOAnZXVJRXv+PweWNFQmvUpwAbXbSsk79B32IY0HpRL4wR
	 rjwwEW2TD9hv/G4foIsXbUzvlWIun2DpGRbBu53cc9CU2adwR8a4lgjEK+tvpyy/D7
	 itKkHqemMOIOPpw+fRhTkAR5RIlpc17Peaai6QO5Z8dMD7TLcLOceUwtQ5+AG/mcMM
	 q63VucpGibYPA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 049C3E330AB;
	Wed, 19 Apr 2023 18:31:28 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: icon@mricon.com, ndesaulniers@google.com, 
 konstantin@linuxfoundation.org, mjg59@srcf.ucam.org, tools@linux.kernel.org
Message-ID: <20230419-b217332c5-20f8f177ac83@bugzilla.kernel.org>
In-Reply-To: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
References: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
Subject: Re: b4: executable sendemail.smtpserver and b4 --reflect
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed, 19 Apr 2023 18:31:28 +0000 (UTC)

ndesaulniers writes via Kernel.org Bugzilla:

Wonderful, thanks as always Konstantin!

View: https://bugzilla.kernel.org/show_bug.cgi?id=217332#c5
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

