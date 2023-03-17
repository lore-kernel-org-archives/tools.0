Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D496AAD
	for <tools@linux.kernel.org>; Fri, 17 Mar 2023 13:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2267CC4339B;
	Fri, 17 Mar 2023 13:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679061536;
	bh=xI8COvHyjOSpfJrDlCLfFRpRMxup2XOpmS2RKVqbuyM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=gdGmZwfTSGUDulx6eVkNzUG7rmCdXRdx+NcLIRFyZTSjmLoFkfAEY9OqnGnLVXKp5
	 PCd8qYPb2xYGWVX0J5jJLgjdCPgpo5z7CC4JkaNVNMOxCM3NgD9TyazWG0rYPPlN1e
	 99gTGK/xAYjugblVlpCSdHSbVeaSU0DvNePg+oC8=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, alison.schofield@intel.com
In-Reply-To: <20230316055523.728335-1-alison.schofield@intel.com>
References: <20230316055523.728335-1-alison.schofield@intel.com>
Subject: Re: [PATCH b4] Avoid case where message-id and in-reply-to id
 match
Message-Id: <167906153598.1546524.9691022776201790671.b4-ty@linuxfoundation.org>
Date: Fri, 17 Mar 2023 09:58:55 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-20972


On Wed, 15 Mar 2023 22:55:23 -0700, alison.schofield@intel.com wrote:
> A user error while sending a patchset created a lore link that b4 is
> not able to handle. The unexpected matching message-id and in-reply-to
> id sends b4 into an infinite loop while 'Analyzing follow-up'.
> 
> Add a check and break for this case.
> 
> b4 am -c https://lore.kernel.org/all/cover.1674070170.git.alison.schofield@intel.com/
> 
> [...]

Applied, thanks!

[1/1] Avoid case where message-id and in-reply-to id match
      commit: 7c06ad19f6a94d367355e5ae8211c409404c7d7d

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

