Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD19028ED
	for <tools@linux.kernel.org>; Thu, 23 Feb 2023 15:05:58 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NEhEaV005127;
	Thu, 23 Feb 2023 15:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=1eKOGgxpZDTKCRwjnRzcVFRavuGp2NmN8bzRtOn6Nvc=;
 b=HUg77jhTBtaUdfaka4EIlZUocZIawFYsvaG92jtgkiXI4DKe4aFJDdFawjW3DjShennA
 aEYMj5Hm85waZACVoHFCE6xOOf5PKQleJeUdMhWewpFCT7xikP/x9q+B2137fpH9GBlx
 ln58JR2AuhoUr8Nymtafo5AWpDtxKQyt9nhSzZ35bpQ8n17NBElxm8/UOg+bVxxAYpqZ
 6z7dpYDed43kBMg6NaIiMWZDCi0Eez1tZxCawHNWX7YVMADTnmHXZ8nuSlvas1GqcabJ
 V1mS5SKnQPZG4aYl4jhPXxzwT8kN+E5bKzHZkexSRFlbkNQt/qvArEPrYfGtlPPIyjW8 Kw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nxa5b8n0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 15:05:48 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31NEKk31015807;
	Thu, 23 Feb 2023 15:05:48 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3ntpa76rax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 15:05:48 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31NF5lak3277510
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Feb 2023 15:05:48 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB28558061;
	Thu, 23 Feb 2023 15:05:47 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C6B758058;
	Thu, 23 Feb 2023 15:05:47 +0000 (GMT)
Received: from localhost (unknown [9.211.113.64])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Feb 2023 15:05:47 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: b4 submission endpoint sender name length
In-Reply-To: <20230222200338.sinridhdzgq2k2dd@meerkat.local>
References: <877cwk9uor.fsf@linux.ibm.com>
 <20230222200338.sinridhdzgq2k2dd@meerkat.local>
Date: Thu, 23 Feb 2023 09:05:46 -0600
Message-ID: <87wn488lrp.fsf@linux.ibm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hhLVvuZSlqbiaHwcJoDtAqQ4sj1E0tVs
X-Proofpoint-GUID: hhLVvuZSlqbiaHwcJoDtAqQ4sj1E0tVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_08,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230118

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:
> On Tue, Feb 14, 2023 at 08:40:36AM -0600, Nathan Lynch wrote:
>> When I checked with the powerpc maintainer (cc'd) to see if my new
>> workflow was causing any issues for him, the only less-than-positive
>> feedback I got was that the sender name set by the endpoint:
>> 
>>   Nathan Lynch via B4 Submission Endpoint
>> 
>> feels a bit long and sticks out in the patchwork UI. Could this be
>> shortened? Perhaps "via B4 web" or similar?
>
> Thank you for the feedback, I've shortened it to "B4 Relay".

Thanks a lot!
