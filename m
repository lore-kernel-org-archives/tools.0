Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110C44C7C
	for <tools@linux.kernel.org>; Tue, 18 Oct 2022 15:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93ED1C433D7;
	Tue, 18 Oct 2022 15:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666105927;
	bh=meGb5L0jGQionXwLjpP/r7qXhjptpzMJXqpflWi2qH8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=vWpZ6u2CKZurJXIm3I/U4DSCMHmR5NzVIRsRfy6MA7Sylqaq+Fxu+b6LByyeLCMcA
	 cEQmkcwENqegVS7wyta7IUW0pM60/2Zx9jVaPjX1u9NF6FdVBsxxQjK8sGPJmwBOrO
	 2C50b43GHeK4MoCcXF+oXQn4q1fk5m7PA5iCW/ag=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Palmer Dabbelt <palmer@rivosinc.com>, tools@linux.kernel.org
In-Reply-To: <20221012230121.29033-1-palmer@rivosinc.com>
References: <20221012230121.29033-1-palmer@rivosinc.com>
Subject: Re: [PATCH] Add a doc for contributors
Message-Id: <166610583088.768059.14629025416813172917.b4-ty@linuxfoundation.org>
Date: Tue, 18 Oct 2022 11:10:30 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-456d6

On Wed, 12 Oct 2022 16:01:21 -0700, Palmer Dabbelt wrote:
> No idea if this is accurate, but I'm trying to send some patches and
> didn't find anything else documenting how to do so.  I'm following my
> own guide to see how accurate it is...
> 
> 

Applied, thanks!

[1/1] Add a doc for contributors
      commit: 456d692d95e48f5341d5be494ef508eb7cee19a5

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
