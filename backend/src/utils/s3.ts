import { S3Client, PutObjectCommand, GetObjectCommand, DeleteObjectCommand } from "@aws-sdk/client-s3";
import { getSignedUrl } from "@aws-sdk/s3-request-presigner";
import dotenv from "dotenv";

dotenv.config();

const s3Client = new S3Client({
  region: process.env.S3_REGION || "us-east-1",
  endpoint: process.env.S3_ENDPOINT,
  credentials: {
    accessKeyId: process.env.S3_ACCESS_KEY || "",
    secretAccessKey: process.env.S3_SECRET_KEY || "",
  },
  forcePathStyle: true, // Needed for MinIO
});

const BUCKET_NAME = process.env.S3_BUCKET || "vivodocs";

export const uploadToS3 = async (fileBuffer: Buffer, fileName: string, mimeType: string) => {
  const command = new PutObjectCommand({
    Bucket: BUCKET_NAME,
    Key: fileName,
    Body: fileBuffer,
    ContentType: mimeType,
  });

  await s3Client.send(command);
  return fileName;
};

export const getSignedFileUrl = async (fileName: string) => {
  const command = new GetObjectCommand({
    Bucket: BUCKET_NAME,
    Key: fileName,
  });

  // URL valid for 1 hour
  return getSignedUrl(s3Client, command, { expiresIn: 3600 });
};

export const deleteFromS3 = async (fileName: string) => {
  const command = new DeleteObjectCommand({
    Bucket: BUCKET_NAME,
    Key: fileName,
  });
  
  await s3Client.send(command);
};
